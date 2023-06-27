import board
import curses

import std/os


proc cleanupAndQuit(): void = 
  curses.endwin()
  quit()


proc ctrlc(): void {.noconv.} = cleanupAndQuit()


proc main(): void = 
  setControlCHook(ctrlc)
  
  var prevBoard = board.new()
  var nextBoard = board.fromFile("board.txt")

  curses.initscr()
  curses.cbreak()
  curses.noecho()
  curses.curs_set(0)

  while nextBoard != prevBoard:
    curses.move(0, 0)
    curses.refresh()
    curses.printw(cstring(nextBoard.toString()))
    prevBoard = nextBoard
    nextBoard = nextBoard.nextGen()
    sleep(100)

  curses.getch()
  cleanupAndQuit()



main()
