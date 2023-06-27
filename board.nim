import std/sequtils
import std/strutils
import std/strformat

const WIDTH* = 80
const HEIGHT* = 24

type Board* = array[HEIGHT, array[WIDTH, bool]]

func new*(): Board = result

func fromString*(str: string): Board = 
  for lineIdx, line in pairs(splitLines(str)):
    for charIdx, char in pairs(line):
      if char == 'x':
        result[lineIdx][charIdx] = true

proc fromFile*(file: string): Board =
  let fileContent = readFile(file)
  let strippedContent = fileContent.strip()
  let lines = strippedContent.split("\n")
  if len(lines) != HEIGHT:
    raise newException(Exception, fmt"Board has wrong height. Expected {HEIGHT}, but got {len(lines)}")
  for lineIdx, line in pairs(lines):
    let strippedLine = line.strip()
    if len(strippedLine) != WIDTH:
      raise newException(Exception, fmt"Board has wrong width. Expected {WIDTH}, but got {len(strippedLine)}")
    for charIdx, char in pairs(strippedLine):
      result[lineIdx][charIdx] = case char
        of 'x': true
        of '.': false
        else: raise newException(Exception, fmt"Unknown character. Expected 'x' or '.', but got '{char}'")

proc toString*(board: Board, lineSep = "\n"): string = 
  for row in board:
    for cell in row:
      result &= (if cell: "x" else: ".")
    result &= lineSep

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
 