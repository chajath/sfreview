COFFEEC=node_modules/coffee-script/bin/coffee
COFFEEFLAGS=-b -o out
JADEC=node_modules/jade/bin/jade
JADEFLAGS=-o out
STYLC=node_modules/stylus/bin/stylus
STYLFLAGS=-o out
COFFEESRC=$(wildcard src/*.coffee)
JADESRC= $(wildcard src/*.jade)
STYLSRC=$(wildcard src/*.styl)

all: $(patsubst %.jade,%.html,$(JADESRC)) $(patsubst %.coffee,%.js,$(COFFEESRC)) $(patsubst %.styl,%.css,$(STYLSRC)) includes

%.html: %.jade
	$(JADEC) $(JADEFLAGS) $<

%.js: %.coffee
	$(COFFEEC) $(COFFEEFLAGS) $<

%.css: %.styl
	$(STYLC) $(STYLFLAGS) $<

includes:
	@if [ -d "out/includes" ]; then rm -rf out/includes; fi
	-mkdir out/includes
	-cp src/includes/* out/includes
