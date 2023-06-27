import board
import curses

import std/os

proc cleanupAndExit(): void = 
  curses.endwin()
  quit()
  

proc ctrlc(): void {.noconv.} = cleanupAndExit()


setControlCHook(ctrlc)
curses.initscr()
curses.cbreak()
curses.curs_set(0)

var prevBoard = board.new()
var nextBoard = board.fromString("""
..x
x.x
.xx""")

while nextBoard != prevBoard:
  curses.move(0, 0)
  curses.refresh()
  nextBoard.print(lineSep="\r\n")
  prevBoard = nextBoard
  nextBoard = nextBoard.nextGen()
  sleep(100)

curses.getch()
cleanupAndExit()
