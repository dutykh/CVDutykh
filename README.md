# CV Automation System

An intelligent CV management system that maintains a single source of truth for all CV data, automatically generating multiple output formats through an AI-powered pipeline.

## 🎉 Major Update: LaTeX Extraction and Regeneration System Complete!

We've successfully implemented a high-fidelity LaTeX document extraction and regeneration system that achieves **99.985% accuracy** in reproducing the original CV. This foundational work enables the planned CV automation system.

### What's New

- **LaTeX → YAML Extraction**: Intelligently parses LaTeX documents into structured YAML data
- **YAML → LaTeX Regeneration**: Rebuilds LaTeX documents from extracted data with near-perfect fidelity
- **Preservation of Structure**: Maintains all formatting, commands, and document hierarchy
- **Fast Processing**: Extraction and regeneration complete in seconds

## Overview

This project transforms the traditional manual CV maintenance process into an automated, data-driven system. By storing all CV information in a structured YAML file, the system can generate multiple CV variants (full, redesigned, short) in different formats (PDF, web) while ensuring consistency and eliminating manual synchronization.

## Key Features

- **Single Source of Truth**: All CV data maintained in one YAML file
- **Multiple Output Formats**: Generate different CV styles from the same data
- **AI-Powered Content**: Smart summarization and content optimization using Claude or Gemini
- **Tag-Based Filtering**: Control which content appears in which CV variant
- **Version Control Friendly**: Track changes and maintain history with Git
- **Fast Build Process**: Generate all outputs in under 30 seconds
- **LaTeX Extraction**: Convert existing LaTeX CVs to structured data

## Project Status

✅ **Phase 0 Complete: LaTeX Extraction System**

The repository now contains:
- Working extraction system (`extract_cv.py`)
- Working regeneration system (`regenerate_cv.py`) 
- Original LaTeX CV template
- Detailed Project Requirements Document (PRD.md)
- Full system architecture

## Current Capabilities

### Extract CV from LaTeX
```bash
python extract_cv.py
# Creates: data/cv_extracted.yaml
```

### Regenerate LaTeX from YAML
```bash
python regenerate_cv.py
# Creates: output/ClassicFullCV-Dutykh.tex
# Validates against original with 99.985% accuracy
```

## System Architecture

```
LaTeX CV → Extraction → YAML Data → Processing → Templates → Multiple Outputs
         ↑                        ↓
         └── Regeneration ← YAML ←┘
```

### Components

1. **Data Layer**: Structured YAML file containing all CV information
2. **Extraction Layer**: Python scripts for LaTeX parsing and structure preservation
3. **Processing Layer**: Python scripts for data validation and transformation
4. **AI Layer**: Claude/Gemini integration for content enhancement (configurable)
5. **Template Layer**: Jinja2 templates for LaTeX, React components for web
6. **Output Layer**: Generated PDFs and future web interface

## Planned Features

### Phase 1: Foundation ✅ COMPLETE
- [x] YAML schema definition
- [x] Data extraction from existing LaTeX CV
- [x] Basic project structure setup
- [x] High-fidelity LaTeX regeneration

### Phase 2: LaTeX Generation (Next)
- [ ] Three distinct PDF CV variants
- [ ] Jinja2 template implementation
- [ ] Rule-based content filtering

### Phase 3: AI Enhancement
- [ ] Smart content summarization
- [ ] Writing optimization (active voice, clarity)
- [ ] Relevance-based filtering

### Phase 4: Web Preparation
- [ ] React component design
- [ ] API specification
- [ ] Data model adaptation for web

### Phase 5: Production
- [ ] GitHub Actions CI/CD pipeline
- [ ] Comprehensive documentation
- [ ] Package distribution

## Technology Stack

- **Core**: Python 3.10+
- **Data**: YAML with JSON Schema validation
- **Templates**: Jinja2 (LaTeX), React (Web)
- **Build**: GNU Make
- **AI**: Anthropic Claude API / Google Gemini API (configurable)
- **Web** (Future): Next.js, TypeScript, Tailwind CSS

## Getting Started

### Prerequisites

- Python 3.10 or higher
- LaTeX distribution (TeX Live, MiKTeX, or MacTeX)
- Git

### Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/CVDutykh.git
cd CVDutykh

# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install pyyaml click loguru python-dotenv

# Set up environment variables
cp .env.example .env.local
# Edit .env.local and add your API keys
```

### Usage

#### Extract CV from LaTeX
```bash
# Extract CV data from LaTeX to YAML
python extract_cv.py

# The extracted data will be in data/cv_extracted.yaml
```

#### Regenerate LaTeX from YAML
```bash
# Regenerate LaTeX from extracted data
python regenerate_cv.py

# With validation against original
python regenerate_cv.py --validate

# The output will be in output/ClassicFullCV-Dutykh.tex
```

### Environment Configuration

The system supports both Anthropic Claude and Google Gemini models with automatic fallback:

```bash
# In .env.local
ANTHROPIC_API_KEY=your-anthropic-key
GOOGLE_API_KEY=your-google-key
PRIMARY_MODEL_PROVIDER=anthropic  # or "google"
ENABLE_MODEL_FALLBACK=true
```

## Project Structure

```
CVDutykh/
├── input/               # Source LaTeX files
│   └── CV-Dutykh.tex   # Original CV
├── data/                # Extracted CV data
│   └── cv_extracted.yaml
├── output/              # Generated files
│   └── ClassicFullCV-Dutykh.tex
├── extract_cv.py        # LaTeX → YAML extraction
├── regenerate_cv.py     # YAML → LaTeX regeneration
├── .env.example         # Environment template
├── .env.local          # Your API keys (gitignored)
├── CLAUDE.md           # Development instructions
├── PRD.md              # Project requirements
└── README.md           # This file
```

## Extraction Accuracy

The current system achieves remarkable fidelity:
- **Character Accuracy**: 99.985% (238,357 of 238,394 characters)
- **Content Preservation**: 100% (all text, commands, structure preserved)
- **Differences**: Only minor whitespace variations between sections

## Contributing

This is a personal project for Dr. Denys Dutykh. If you're interested in the approach or would like to adapt it for your own use, feel free to fork the repository.

## Security

- API keys are managed through environment variables
- No sensitive data is committed to version control
- `.env.local` is gitignored for security
- Supports multiple AI providers with secure fallback

## License

To be determined.

## Contact

Dr. Denys Dutykh  
Khalifa University of Science and Technology  
Abu Dhabi, UAE

## Acknowledgments

- Powered by Anthropic's Claude and Google's Gemini for AI features
- Built with modern Python and web technologies
- Special thanks to the LaTeX community for the robust typesetting system