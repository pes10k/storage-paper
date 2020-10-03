extensions_to_clean := out aux log bbl blg fls fdb_latexmk glg gls lof glo glsdefs lot toc dvi ist acn acr synctex.gz alg xdy

all: main

clean:
	@if [[ -f main.pdf ]]; then \
		rm main.pdf;\
	fi;
	@for extension in $(extensions_to_clean); do \
		find . -type f -name "*.$$extension" -delete;\
	done;
	@rm -f diff.*

main:
	latexmk -bibtex -pdf main
	pdflatex -bibtex -interaction=batchmode main

diff:
	latexmk -bibtex -pdf diff
	pdflatex -bibtex -interaction=batchmode diff
