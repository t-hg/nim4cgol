const header = "<curses.h>"
proc initscr*(): void {.importc: "initscr", header: header.}
proc endwin*(): void {.importc: "endwin", header: header.}
proc getch*(): void {.importc: "getch", header: header.}
proc refresh*(): void {.importc: "refresh", header: header.}
proc move*(y: cint, x: cint): void {.importc: "move", header: header.}
proc cbreak*(): void {.importc: "cbreak", header: header.}
proc curs_set*(mode: cint): void {.importc: "curs_set", header: header}

