.PHONY: all
all: build

.PHONY: build
build: 
	nim c --passL:"$(shell pkg-config --libs ncurses)" cgol.nim

.PHONY: run
run: build
	./cgol

.PHONY: clean
clean:
	rm -f cgol
