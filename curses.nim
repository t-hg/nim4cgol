const header = "<curses.h>"
proc initscr*(): void {.importc: "initscr", header: header.}
proc endwin*(): void {.importc: "endwin", header: header.}
proc getch*(): void {.importc: "getch", header: header.}
