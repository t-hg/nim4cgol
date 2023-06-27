import std/sequtils
import std/strutils

const WIDTH* = 80
const HEIGHT* = 24

type Board* = array[HEIGHT, array[WIDTH, bool]]

func new*(): Board = result

func fromString*(str: string): Board = 
  for lineIdx, line in pairs(splitLines(str)):
    for charIdx, char in pairs(line):
      if char == 'x':
        result[lineIdx][charIdx] = true

proc print*(board: Board, lineSep = "\n"): void = 
  for row in board:
    for cell in row:
      if cell: stdout.write("x") else: stdout.write(".")
    stdout.write(lineSep)

func aliveNeighbours(board: Board, row: int, col: int): int = 
  let n1 = if row > 0 and col > 0: board[row-1][col-1] else: false
  let n2 = if row > 0: board[row-1][col] else: false
  let n3 = if row > 0 and col < WIDTH-1: board[row-1][col+1] else: false
  let n4 = if col > 0: board[row][col-1] else: false
  let n5 = if col < WIDTH-1: board[row][col+1] else: false
  let n6 = if row < HEIGHT-1 and col > 0: board[row+1][col-1] else: false
  let n7 = if row < HEIGHT-1: board[row+1][col] else: false
  let n8 = if row < HEIGHT-1 and col < WIDTH-1: board[row+1][col+1] else: false
  let ns = toSeq([n1, n2, n3, n4, n5, n6, n7, n8])
  result = ns.countIt(it)
  

func nextGen*(board: Board): Board = 
  for row in 0..<HEIGHT:
    for col in 0..<WIDTH:
      let alive = board.aliveNeighbours(row, col)
      if board[row][col] and (alive == 2 or alive == 3):
        result[row][col] = true
      elif not board[row][col] and alive == 3:
        result[row][col] = true
      else:
         result[row][col] = false
 