const header = "<curses.h>"

type WindowPtr* {.importc: "WINDOW*", header: header.} = distinct pointer
type MouseMask* {.importc: "mmask_t", header: header.} = int
type MouseMaskPtr* {.importc: "mmask_t*", header: header.} = distinct pointer

template ToMouseMask(b, m: int32): MouseMask = ((m) shl (((b) - 1) * 5))
const AllMouseEvents*: MouseMask = ToMouseMask(5, 0o010) - 1

proc cbreak*(): void {.importc: "cbreak", header: header.}
proc curs_set*(mode: cint): void {.importc: "curs_set", header: header.}
proc endwin*(): void {.importc: "endwin", header: header.}
proc getch*(): cint {.importc: "getch", header: header.}
proc initscr*(): WindowPtr {.importc: "initscr", header: header.}
proc keypad*(win: WindowPtr, enabled: bool): void {.importc: "keypad", header:header.}
proc mousemask*(newMask: MouseMask, oldMask: MouseMaskPtr): void {.importc: "mousemask", header:header.}
proc move*(y: cint, x: cint): void {.importc: "move", header: header.}
proc noecho*(): void {.importc: "noecho", header: header.}
proc printw*(str: cstring): void {.importc: "printw", header: header.}
proc refresh*(): void {.importc: "refresh", header: header.}
proc timeout*(delay: cint): void {.importc: "timeout", header: header.}

