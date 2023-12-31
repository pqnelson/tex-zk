TEX=pdflatex
BIB=bibtex
FILE=zk

all:
	$(TEX) $(FILE)
	$(TEX) $(FILE)

bib:
	$(TEX) $(FILE)
	$(BIB) $(FILE)
	$(TEX) $(FILE)
	$(TEX) $(FILE)
