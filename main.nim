import board
import curses

proc main(): void =
  curses.initscr()
  # term.enableAlternateScreen()
 
#   var prevBoard = board.new()
#   var nextBoard = board.fromString("""
# ..x
# x.x
# .xx""")

  # while nextBoard != prevBoard :
  #   nextBoard.print()
  #   prevBoard = nextBoard
  #   nextBoard = nextBoard.nextGen()
  curses.getch()
  curses.endwin()

main()
