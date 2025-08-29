# Metadata File (LaTeX header code to allow editing theme options, titlegraphic) 
METADATA ?= metadata.yml

# Source file directory
SRC_DIR ?= src

# Target/Build directory for PDF files
OUT_DIR ?= out

# Pandoc flags, currently: -t beamer (template beamer) --metadata-file (sets metadata-file) -o (set output to file)
PANDOC_FLAGS = -t beamer --metadata-file "$(METADATA)"

# Pandoc Command up until variable file name src and dest
PANDOC = pandoc $(PANDOC_FLAGS) 

# Below assignments are immediate-to-immediate in unlikely case files change after make starts.
# Avoids broken states.

# Markdown source files
SRC_MD := $(wildcard $(SRC_DIR)/*.md)
# Org Mode source files
SRC_ORG := $(wildcard $(SRC_DIR)/*.org)

# Generate target PDF files from source files by rewriting file extensions.
# .md => .pdf
PDFS := $(patsubst ${SRC_DIR}/%.md, ${OUT_DIR}/%.pdf, ${SRC_MD})
# .org => .pdf
PDFS += $(patsubst ${SRC_DIR}/%.org, ${OUT_DIR}/%.pdf, ${SRC_ORG})

.PHONY: all clean

# `all` builds PDFs from .md & .org files
all : $(PDFS)

# Markdown to PDF Rule
$(OUT_DIR)/%.pdf : $(SRC_DIR)/%.md
	# -p flag = parents = make parent directories as needed.
	# "$(@D)" = Directory part of target's filename.
	# mkdir -p "$(@D)" = Make OUT_DIR if it doesn't exist, otherwise ignore
	mkdir -p "$(@D)"
	$(PANDOC) "$<" -o "$@"

# Org Mode Support (Untested)
$(OUT_DIR)/%.pdf : $(SRC_DIR)/%.org
	mkdir -p "$(@D)"
	$(PANDOC) "$<" -o "$@"

clean:
	$(RM) -r "$(OUT_DIR)"
