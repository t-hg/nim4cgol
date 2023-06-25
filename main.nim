import board

proc main(): void =
  let newBoard =  board.new()
  let nextBoard = newBoard.nextGen()
  nextBoard.print()

main()
