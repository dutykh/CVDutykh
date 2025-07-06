#!/usr/bin/env python3
"""
Regenerate LaTeX from fixed structure YAML.
"""

import sys
import yaml
import click
from pathlib import Path
from loguru import logger


# Configure logger
logger.remove()
logger.add(sys.stderr, level="INFO")


def regenerate_document(cv_data):
    """Regenerate LaTeX document from structured data."""
    parts = []
    
    # Add preamble
    parts.append(cv_data['preamble'])
    
    # Add \begin{document}
    parts.append('\n\\begin{document}')
    
    # Add frontmatter (content before first section)
    if cv_data.get('frontmatter'):
        parts.append('\n' + cv_data['frontmatter'])
    
    # Add sections
    for section in cv_data['sections']:
        # Add section header
        parts.append('\n' + section['header'])
        
        # Add section intro (content before first subsection)
        if section.get('intro'):
            parts.append(section['intro'])
        
        # Add subsections
        for subsection in section.get('subsections', []):
            parts.append(subsection['content'])
    
    # Add \end{document}
    parts.append('\n\\end{document}')
    
    # Add epilogue if any
    if cv_data.get('epilogue'):
        parts.append(cv_data['epilogue'])
    
    return '\n'.join(parts)


@click.command()
@click.option('--input', '-i',
              default='data/cv_extracted.yaml',
              help='Input YAML file')
@click.option('--output', '-o',
              default='output/ClassicFullCV-Dutykh.tex',
              help='Output LaTeX file')
@click.option('--validate/--no-validate',
              default=True,
              help='Validate against original')
def main(input, output, validate):
    """Regenerate LaTeX from fixed structure YAML."""
    
    # Check input file
    input_path = Path(input)
    if not input_path.exists():
        logger.error(f"Input file not found: {input}")
        sys.exit(1)
    
    # Create output directory
    output_path = Path(output)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    
    logger.info(f"Regenerating LaTeX from: {input}")
    
    # Load YAML data
    with open(input_path, 'r', encoding='utf-8') as f:
        cv_data = yaml.safe_load(f)
    
    logger.info(f"Loaded CV data with {len(cv_data.get('sections', []))} sections")
    
    # Regenerate LaTeX
    regenerated = regenerate_document(cv_data)
    
    # Save output
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(regenerated)
    
    logger.info(f"Saved regenerated LaTeX to: {output}")
    logger.info(f"  Output size: {len(regenerated)} characters")
    
    # Validate if requested
    if validate:
        original_path = Path('input/CV-Dutykh.tex')
        if not original_path.exists():
            logger.warning("Original file not found for validation")
        else:
            with open(original_path, 'r', encoding='utf-8') as f:
                original = f.read()
            
            # Normalize for comparison
            orig_normalized = '\n'.join(line.rstrip() for line in original.split('\n'))
            regen_normalized = '\n'.join(line.rstrip() for line in regenerated.split('\n'))
            
            if orig_normalized == regen_normalized:
                logger.success("✓ Regenerated LaTeX is identical to original!")
            else:
                logger.warning("Files are not identical")
                logger.info(f"  Original: {len(orig_normalized)} chars")
                logger.info(f"  Regenerated: {len(regen_normalized)} chars")
                
                # Find first difference
                for i, (o, r) in enumerate(zip(orig_normalized, regen_normalized)):
                    if o != r:
                        logger.info(f"  First difference at position {i}")
                        logger.info(f"  Context: ...{orig_normalized[max(0,i-20):i+20]}...")
                        break


if __name__ == '__main__':
    main()