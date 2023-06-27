.PHONY: all
all: run

.PHONY: run
run: 
	nim r -d:nimDebugDlOpen --passL:"$(shell pkg-config --libs ncurses)" main.nim
