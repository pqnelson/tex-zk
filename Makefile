TEX=pdflatex
BIB=bibtex
FILE=zk

all: bib
	$(TEX) $(FILE)
	$(TEX) $(FILE)

bib:
	$(TEX) $(FILE)
	$(BIB) $(FILE)