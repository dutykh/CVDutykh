#!/usr/bin/env python3
"""
Fixed extraction script that properly handles document structure.
"""

import sys
import yaml
import re
from pathlib import Path
from loguru import logger
from datetime import datetime

# Configure logger
logger.remove()
logger.add(sys.stderr, level="INFO")


def fix_urls_in_content(content: str) -> str:
    """Fix URLs in href commands that are missing protocol."""
    
    # Pattern to find \href{...} commands
    href_pattern = re.compile(r'\\href\{([^}]+)\}')
    
    def fix_url(match):
        url = match.group(1)
        
        # Skip if already has a protocol
        if url.startswith(('http://', 'https://', 'ftp://', 'mailto:')):
            return match.group(0)
        
        # Skip if it's a local file reference
        if url.startswith(('#', '/', './', '../')):
            return match.group(0)
            
        # Add https:// to URLs that look like web addresses
        if '.' in url and not url.startswith('.'):
            logger.debug(f"Fixing URL: {url} -> https://{url}")
            return f'\\href{{https://{url}}}'
        
        return match.group(0)
    
    # Apply the fix to all href commands
    fixed_content = href_pattern.sub(fix_url, content)
    
    # Count how many URLs were fixed
    original_urls = href_pattern.findall(content)
    fixed_urls = href_pattern.findall(fixed_content)
    fixes_made = sum(1 for o, f in zip(original_urls, fixed_urls) if o != f and not o.startswith(('http://', 'https://')))
    
    if fixes_made > 0:
        logger.info(f"Fixed {fixes_made} URLs missing protocol")
    
    return fixed_content


def extract_document_parts(content: str):
    """Extract document into logical parts without duplication."""
    
    # Fix URLs first
    content = fix_urls_in_content(content)
    
    # Find preamble (everything before \begin{document})
    doc_start = content.find(r'\begin{document}')
    if doc_start == -1:
        logger.error("No \\begin{document} found")
        return None
    
    preamble = content[:doc_start].strip()
    
    # Find document end
    doc_end = content.find(r'\end{document}')
    if doc_end == -1:
        doc_content = content[doc_start + len(r'\begin{document}'):].strip()
        epilogue = ""
    else:
        doc_content = content[doc_start + len(r'\begin{document}'):doc_end].strip()
        epilogue = content[doc_end + len(r'\end{document}'):].strip()
    
    # Extract the content between \begin{document} and first \section
    first_section = re.search(r'\\section\{', doc_content)
    if first_section:
        frontmatter = doc_content[:first_section.start()].strip()
        main_content = doc_content[first_section.start():]
    else:
        frontmatter = doc_content
        main_content = ""
    
    return {
        'preamble': preamble,
        'frontmatter': frontmatter,
        'main_content': main_content,
        'epilogue': epilogue
    }


def split_sections(content: str):
    """Split content into sections without duplication."""
    sections = []
    
    # Find all section positions
    section_pattern = re.compile(r'\\section\{([^}]+)\}')
    matches = list(section_pattern.finditer(content))
    
    for i, match in enumerate(matches):
        section_start = match.start()
        section_title = match.group(1)
        
        # Find where this section ends (at next section or end of content)
        if i + 1 < len(matches):
            section_end = matches[i + 1].start()
        else:
            section_end = len(content)
        
        section_content = content[section_start:section_end].strip()
        
        # Now split this section into header and subsections
        section_header = match.group(0)  # Just the \section{...} line
        after_header = section_content[len(section_header):].strip()
        
        # Find subsections within this section
        subsections = split_subsections(after_header)
        
        # Find content before first subsection
        if subsections:
            first_subsection_match = re.search(r'\\subsection\{', after_header)
            if first_subsection_match:
                section_intro = after_header[:first_subsection_match.start()].strip()
            else:
                section_intro = after_header
        else:
            section_intro = after_header
        
        sections.append({
            'title': section_title,
            'header': section_header,
            'intro': section_intro,
            'subsections': subsections
        })
    
    return sections


def split_subsections(content: str):
    """Split content into subsections."""
    subsections = []
    
    # Find all subsection positions
    subsection_pattern = re.compile(r'\\subsection\{([^}]+)\}')
    matches = list(subsection_pattern.finditer(content))
    
    for i, match in enumerate(matches):
        subsection_start = match.start()
        subsection_title = match.group(1)
        
        # Find where this subsection ends
        if i + 1 < len(matches):
            subsection_end = matches[i + 1].start()
        else:
            subsection_end = len(content)
        
        subsection_content = content[subsection_start:subsection_end].strip()
        
        subsections.append({
            'title': subsection_title,
            'content': subsection_content
        })
    
    return subsections


def main():
    """Extract CV with proper structure."""
    
    input_path = Path("input/CV-Dutykh.tex")
    output_path = Path("data/cv_extracted.yaml")
    
    # Create output directory
    output_path.parent.mkdir(parents=True, exist_ok=True)
    
    logger.info(f"Extracting CV from: {input_path}")
    
    # Read input file
    with open(input_path, 'r', encoding='utf-8') as f:
        content = f.read()
        
    logger.info(f"Loaded {len(content)} characters")
    
    # Extract document parts
    parts = extract_document_parts(content)
    if not parts:
        logger.error("Failed to extract document parts")
        return
    
    # Split main content into sections
    sections = split_sections(parts['main_content'])
    
    logger.info(f"Extracted {len(sections)} sections")
    
    # Create document structure
    cv_data = {
        'metadata': {
            'source_file': str(input_path),
            'extraction_date': datetime.now().isoformat(),
            'extraction_method': 'fixed_structure'
        },
        'preamble': parts['preamble'],
        'frontmatter': parts['frontmatter'],
        'sections': sections,
        'epilogue': parts['epilogue']
    }
    
    # Save to YAML
    logger.info(f"Saving to: {output_path}")
    with open(output_path, 'w', encoding='utf-8') as f:
        yaml.dump(cv_data, f, 
                  default_flow_style=False, 
                  allow_unicode=True,
                  sort_keys=False,
                  width=120)
    
    # Display summary
    logger.info("Extraction complete!")
    logger.info(f"  Sections: {len(sections)}")
    
    total_subsections = sum(len(s['subsections']) for s in sections)
    logger.info(f"  Subsections: {total_subsections}")
    
    file_size = output_path.stat().st_size / 1024
    logger.info(f"  Output size: {file_size:.1f} KB")


if __name__ == '__main__':
    main()