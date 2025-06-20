# Metadata File (LaTeX header code to allow editing theme options, titlegraphic) 
METADATA=metadata.yml
# Pandoc flags
# Currently: -t beamer (template beamer) --metadata-file (sets metadata-file) -o (set output to file) 
PANDOC_FLAGS := -t beamer
PANDOC_FLAGS += --metadata-file $(METADATA)
# Pandoc Command up until variable file name src and dest
PANDOC := pandoc $(PANDOC_FLAGS) 

# Markdown to PDF Rule
%.pdf : %.md
	$(PANDOC) $< -o $@

# Org Mode Support (Untested)
%.pdf : %.org
	$(PANDOC) $< -o $@
