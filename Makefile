COFFEEC=node_modules/coffee-script/bin/coffee
COFFEEFLAGS=-b -p
JADEC=node_modules/jade/bin/jade
JADEFLAGS=-o out
STYLC=node_modules/stylus/bin/stylus
STYLFLAGS=-o out
COFFEESRC=$(wildcard src/*.coffee)
JADESRC= $(wildcard src/*.jade)
STYLSRC=$(wildcard src/*.styl)
ARTICLESRC=$(wildcard src/article/*.jade)

all: $(patsubst src/%.jade,out/%.html,$(JADESRC)) $(patsubst src/%.coffee,out/%.js,$(COFFEESRC)) $(patsubst src/%.styl,out/%.css,$(STYLSRC)) article includes

article: $(patsubst src/article/%.jade,out/article/%.html,$(ARTICLESRC))

out/%.html: src/%.jade
	$(JADEC) $(JADEFLAGS) $<

out/article/%.html: src/article/%.jade
	$(JADEC) $(JADEFLAGS) $<

out/%.js: src/%.coffee
	$(COFFEEC) $(COFFEEFLAGS) $< > $@

out/%.css: src/%.styl
	$(STYLC) $(STYLFLAGS) $<

includes:
	@if [ -d "out/includes" ]; then rm -rf out/includes; fi
	-mkdir out/includes
	-cp src/includes/* out/includes
