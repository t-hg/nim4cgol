import board
import curses

import std/strformat


proc cleanupAndQuit(): void = 
  curses.endwin()
  quit()


proc ctrlc(): void {.noconv.} = cleanupAndQuit()


proc main(): void = 
  setControlCHook(ctrlc)
  
  var board = board.fromFile("board.txt")

  let stdscr = curses.initscr()
  curses.cbreak()
  curses.noecho()
  curses.curs_set(0)
  curses.timeout(100)
  curses.keypad(stdscr, true)
  curses.mousemask(curses.AllMouseEvents, nil)

  while true:
    let ch = curses.getch()
    curses.move(0, 0)
    curses.refresh()
    curses.printw(cstring(board.toString()))
    curses.printw(cstring(&"ch: {ch}\n"))
    board = board.nextGen()

  cleanupAndQuit()



main()
