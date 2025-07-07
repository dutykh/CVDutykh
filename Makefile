# Makefile for compiling LaTeX CVs

# Author: Denys Dutykh

# --- Variables ---
CLASSIC_SRC = Classic/ClassicFullCV-Dutykh.tex
CLASSIC_PDF = Classic/build/ClassicFullCV-Dutykh.pdf
CLASSIC_DIR = Classic

SHORT_SRC = Short/ShortCV-Dutykh.tex
SHORT_PDF = Short/build/ShortCV-Dutykh.pdf
SHORT_DIR = Short
SHORT_DEPS = $(wildcard Short/parts/*.tex) Short/style_short.sty

MODERN_SRC = Modern/ModernFullCV-Dutykh.tex
MODERN_PDF = Modern/build/ModernFullCV-Dutykh.pdf
MODERN_DIR = Modern
MODERN_DEPS = $(wildcard Modern/parts/*.tex) $(wildcard Modern/parts/7_research/*.tex) Modern/style_full.sty

# --- Phony Targets ---
.PHONY: all classic short modern clean help build_classic build_short build_modern

# --- Main Targets (User-facing) ---

all: build_classic build_short build_modern
	@echo "All CVs compiled successfully. Cleaning up..."
	@$(MAKE) clean

classic: build_classic
	@echo "Classic CV compiled successfully. Cleaning up..."
	@$(MAKE) clean

short: build_short
	@echo "Short CV compiled successfully. Cleaning up..."
	@$(MAKE) clean

modern: build_modern
	@echo "Modern CV compiled successfully. Cleaning up..."
	@$(MAKE) clean

# --- Build Targets (Internal) ---

build_classic: $(CLASSIC_PDF)

build_short: $(SHORT_PDF)

build_modern: $(MODERN_PDF)

# --- Compilation Rules ---

$(CLASSIC_PDF): $(CLASSIC_SRC)
	@echo "Compiling Classic CV..."
	(cd $(CLASSIC_DIR) && pdflatex -output-directory=build $(notdir $(CLASSIC_SRC)))
	(cd $(CLASSIC_DIR) && pdflatex -output-directory=build $(notdir $(CLASSIC_SRC)))

$(SHORT_PDF): $(SHORT_SRC) $(SHORT_DEPS)
	@echo "Compiling Short CV..."
	(cd $(SHORT_DIR) && pdflatex -output-directory=build $(notdir $(SHORT_SRC)))
	(cd $(SHORT_DIR) && pdflatex -output-directory=build $(notdir $(SHORT_SRC)))

$(MODERN_PDF): $(MODERN_SRC) $(MODERN_DEPS)
	@echo "Compiling Modern CV..."
	(cd $(MODERN_DIR) && pdflatex -output-directory=build $(notdir $(MODERN_SRC)))
	(cd $(MODERN_DIR) && pdflatex -output-directory=build $(notdir $(MODERN_SRC)))

# --- Help and Clean Rules ---

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  all       Compile all available CVs and clean temporary files."
	@echo "  classic   Compile the Classic version of the CV and clean."
	@echo "  short     Compile the Short version of the CV and clean."
	@echo "    modern    Compile the Modern version of the CV and clean."
	@echo "  clean     Remove temporary compilation files."
	@echo "  help      Show this help message."

# --- Clean Rule ---

clean:
	@echo "Cleaning up temporary files..."
	@rm -f */build/*.aux */build/*.log */build/*.out */build/*.toc */build/*.nav */build/*.snm
	@rm -f Modern/parts/*.aux
