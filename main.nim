import board

proc main(): void =
 
  var prevBoard = board.new()
  var nextBoard = board.fromString("""
..x
x.x
.xx""")

  while nextBoard != prevBoard :
    nextBoard.print()
    prevBoard = nextBoard
    nextBoard = nextBoard.nextGen()

main()
