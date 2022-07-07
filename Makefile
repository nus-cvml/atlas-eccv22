DOCS = $(basename $(shell find . -name "*.jemdoc"))

COMPILER = jemdoc
CONF = mysite.conf

HDOCS=$(addsuffix .html, $(DOCS))

.PHONY: all
all: $(HDOCS)

%.html: %.jemdoc
	$(COMPILER) -c $(CONF) -o $@ $<

.PHONY: upload
upload:
	git add . 
	git commit -m "regular update"
	git push -u origin main

.PHONY: clean
clean: 
	-rm -f $(HDOCS)