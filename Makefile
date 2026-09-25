LABS := 01 02 03 04 05 06 07 08

.PHONY: help render-html clean

help:
	@echo "make render-html  - render reports to HTML and presentations to revealjs"
	@echo "make clean        - remove Quarto output directories"

render-html:
	@for n in $(LABS); do \
		quarto render labs/lab$$n/report --to html; \
		quarto render labs/lab$$n/presentation --to revealjs; \
	done

clean:
	@find labs -type d \( -name _output -o -name .quarto \) -prune -exec rm -rf {} +
