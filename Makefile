BUILD_DIR := build
LATEXOPTS := -output-directory=$(BUILD_DIR) \
			 -interaction=nonstopmode \
			 -shell-escape

.PHONY: all clean prepare main release preview/notes.pdf preview/exercises.pdf

all: prepare main exercises release

main: build/notes.pdf

exercises: build/exercises.pdf

build/notes.pdf: notes.tex
	latexmk $(LATEXOPTS) notes.tex

build/exercises.pdf: exercises.tex
	latexmk $(LATEXOPTS) exercises.tex

preview/notes.pdf: notes.tex
	latexmk $(LATEXOPTS) -pvc notes.tex

preview/exercises.pdf: exercises.tex
	latexmk $(LATEXOPTS) -pvc exercises.tex

clean:
	rm -rf build print
	latexmk -c

prepare:
	mkdir -p build print

release:
	cp build/*.pdf print
