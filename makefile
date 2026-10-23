CVPUBS := ../cv/publications

# Copy the newest <date>-publications.json written by the CV's
# parse_publications.py into the site's data directory.
publications:
	@latest=$$(ls -t $(CVPUBS)/*-publications.json | head -1); \
	cp $$latest data/publications.json && echo "Copied $$latest"

serve:
	hugo server

build:
	hugo --gc --minify

.PHONY: publications serve build
