# Metadata File (LaTeX header code to allow editing theme options, titlegraphic) 
METADATA ?= metadata.yml

# Source file directory
SRC_DIR ?= src

# Target directory for PDF files
OUT_DIR ?= out

# Pandoc flags, currently: -t beamer (template beamer) --metadata-file (sets metadata-file) -o (set output to file)
PANDOC_FLAGS = -t beamer --metadata-file "$(METADATA)"

# Pandoc Command up until variable file name src and dest
PANDOC = pandoc $(PANDOC_FLAGS)

# The below assignments are immediate-to-immediate in case (unlikely) files change after make starts. This avoids broken states.

# Markdown source files
SRC_MD  := $(wildcard $(SRC_DIR)/*.md)
SRC_ORG := $(wildcard $(SRC_DIR)/*.org)

# Generate target PDF files from the source files (by rewriting the file extensions)
PDFS := $(patsubst ${SRC_DIR}/%.md, ${OUT_DIR}/%.pdf, ${SRC_MD})
PDFS += $(patsubst ${SRC_DIR}/%.org, ${OUT_DIR}/%.pdf, ${SRC_ORG})

# Mark all phony in case we ever have a file called `all`
.PHONY: all clean

# all rule builds PDFs from every .md or .org file
all: $(PDFS)

# Markdown to PDF Rule
$(OUT_DIR)/%.pdf: $(SRC_DIR)/%.md
	mkdir -p "$(@D)"
	$(PANDOC) "$<" -o "$@"

# Org Mode Support (Untested)
$(OUT_DIR)/%.pdf: $(SRC_DIR)/%.org
	mkdir -p "$(@D)"
	$(PANDOC) "$<" -o "$@"

clean:
	$(RM) -r "$(OUT_DIR)"

