# =============================================================================
#  Makefile — compile Denys Dutykh's three CVs with the Typst compiler.
#  Styles: Classic, Modern, Short.
#
#  PDFs are written to the SAME canonical paths as the former LaTeX build, so
#  external GitHub raw-URL links keep working:
#      Classic/build/ClassicFullCV-Dutykh.pdf
#      Modern/build/ModernFullCV-Dutykh.pdf
#      Short/build/ShortCV-Dutykh.pdf
#  The archived LaTeX sources live in legacy/.
# =============================================================================

TYPST      ?= typst
FONT_PATH  := fonts
# PDF/A-2b: archival standard — embeds fonts, stable for long-term & ATS parsing.
PDF_STD    := a-2b
TYPSTFLAGS := --font-path $(FONT_PATH) --root . --pdf-standard $(PDF_STD)

CLASSIC_SRC := src/ClassicFullCV-Dutykh.typ
MODERN_SRC  := src/ModernFullCV-Dutykh.typ
SHORT_SRC   := src/ShortCV-Dutykh.typ

# Canonical paths (kept for backward-compatible GitHub raw URLs)
CLASSIC_PDF := Classic/build/ClassicFullCV-Dutykh.pdf
MODERN_PDF  := Modern/build/ModernFullCV-Dutykh.pdf
SHORT_PDF   := Short/build/ShortCV-Dutykh.pdf

# Convenience mirror: all three PDFs gathered in one folder
OUT := out

# Shared dependencies (any change triggers a rebuild)
DEPS := $(wildcard themes/*.typ) $(wildcard content/*.typ) $(wildcard content/**/*.typ)

# Font assets fetched by `make fonts`
SS3      := $(FONT_PATH)/SourceSans3.ttf
FA_SOLID := $(FONT_PATH)/fa-solid-900.ttf

.PHONY: all classic short modern fonts watch-classic watch-modern watch-short clean help

# --- Main targets ------------------------------------------------------------
all: short modern classic
	@echo "All CVs compiled into their canonical build/ folders."

classic: fonts $(CLASSIC_PDF)
short:   fonts $(SHORT_PDF)
modern:  fonts $(MODERN_PDF)

$(CLASSIC_PDF): $(CLASSIC_SRC) $(DEPS) | Classic/build $(OUT)
	@echo "Compiling Classic CV..."
	$(TYPST) compile $(TYPSTFLAGS) $(CLASSIC_SRC) $@
	@cp $@ $(OUT)/

$(MODERN_PDF): $(MODERN_SRC) $(DEPS) | Modern/build $(OUT)
	@echo "Compiling Modern CV..."
	$(TYPST) compile $(TYPSTFLAGS) $(MODERN_SRC) $@
	@cp $@ $(OUT)/

$(SHORT_PDF): $(SHORT_SRC) $(DEPS) | Short/build $(OUT)
	@echo "Compiling Short CV..."
	$(TYPST) compile $(TYPSTFLAGS) $(SHORT_SRC) $@
	@cp $@ $(OUT)/

Classic/build Modern/build Short/build $(OUT):
	@mkdir -p $@

# --- Live preview ------------------------------------------------------------
watch-classic: fonts | Classic/build
	$(TYPST) watch $(TYPSTFLAGS) $(CLASSIC_SRC) $(CLASSIC_PDF)
watch-modern: fonts | Modern/build
	$(TYPST) watch $(TYPSTFLAGS) $(MODERN_SRC) $(MODERN_PDF)
watch-short: fonts | Short/build
	$(TYPST) watch $(TYPSTFLAGS) $(SHORT_SRC) $(SHORT_PDF)

# --- Fonts (downloaded once into fonts/; keeps the repo reproducible) --------
fonts: $(SS3) $(FA_SOLID)

$(SS3):
	@echo "Fetching Source Sans 3..."
	@mkdir -p $(FONT_PATH)
	@curl -fsSL -o "$(FONT_PATH)/SourceSans3.ttf"        "https://github.com/google/fonts/raw/main/ofl/sourcesans3/SourceSans3%5Bwght%5D.ttf"
	@curl -fsSL -o "$(FONT_PATH)/SourceSans3-Italic.ttf" "https://github.com/google/fonts/raw/main/ofl/sourcesans3/SourceSans3-Italic%5Bwght%5D.ttf"

$(FA_SOLID):
	@echo "Fetching Font Awesome 6 Free..."
	@mkdir -p $(FONT_PATH)
	@base="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.7.2/webfonts"; \
	for f in fa-solid-900 fa-regular-400 fa-brands-400; do \
	  curl -fsSL -o "$(FONT_PATH)/$$f.ttf" "$$base/$$f.ttf"; \
	done

# --- Housekeeping ------------------------------------------------------------
clean:
	@echo "Removing compiled PDFs..."
	@rm -f $(CLASSIC_PDF) $(MODERN_PDF) $(SHORT_PDF) $(OUT)/*.pdf

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "  all       Compile all three CVs to their canonical build/ folders (default)."
	@echo "  classic   Compile the Classic CV   -> $(CLASSIC_PDF)"
	@echo "  modern    Compile the Modern CV    -> $(MODERN_PDF)"
	@echo "  short     Compile the Short CV     -> $(SHORT_PDF)"
	@echo "  watch-*   Live-preview a CV (watch-classic/-modern/-short)."
	@echo "  fonts     Download Source Sans 3 + Font Awesome 6 into fonts/."
	@echo "  clean     Remove the compiled PDFs."
	@echo "  help      Show this message."
