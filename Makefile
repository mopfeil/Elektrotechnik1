# Uebungsblaetter GET Teil 1 -- Build
#   make          -> alle Blaetter (Aufgaben + Loesung) nach build/
#   make blatt03  -> nur Blatt 3
#   make clean    -> Hilfsdateien loeschen

BLAETTER := $(sort $(notdir $(wildcard blatt[0-9][0-9])))
TEXINPUTS := $(CURDIR)/vorlage//:
LATEX := TEXINPUTS=$(TEXINPUTS) pdflatex -interaction=nonstopmode -halt-on-error

.PHONY: all clean $(BLAETTER)
.SECONDEXPANSION:

all: $(BLAETTER)

$(BLAETTER): %: build/%_aufgaben.pdf build/%_loesung.pdf

build/%_aufgaben.pdf: $$*/$$*.tex vorlage/get-uebung.sty
	@mkdir -p build/tmp
	cd $* && $(LATEX) -output-directory=../build/tmp -jobname=$*_aufgaben "\def\mitloesung{0}\input{$*.tex}" >/dev/null
	cd $* && $(LATEX) -output-directory=../build/tmp -jobname=$*_aufgaben "\def\mitloesung{0}\input{$*.tex}" >/dev/null
	cp build/tmp/$*_aufgaben.pdf $@

build/%_loesung.pdf: $$*/$$*.tex vorlage/get-uebung.sty
	@mkdir -p build/tmp
	cd $* && $(LATEX) -output-directory=../build/tmp -jobname=$*_loesung "\def\mitloesung{1}\input{$*.tex}" >/dev/null
	cd $* && $(LATEX) -output-directory=../build/tmp -jobname=$*_loesung "\def\mitloesung{1}\input{$*.tex}" >/dev/null
	cp build/tmp/$*_loesung.pdf $@

clean:
	rm -rf build/tmp
