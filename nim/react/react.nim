import sequtils, tables

type
  Callback = proc(val: int): void
  CallbackRef = int

  Cell* = ref object of RootObj
    val: int
    nextCallback: int
    callbacks*: Table[CallbackRef, Callback]
    consumers*: seq[ComputeCell]

  InputCell = ref object of Cell

  ComputeCell = ref object of Cell
    dependencies: seq[Cell]
    calculate: proc(vals: seq[int]): int

  Reactor = ref object

method value*(cell: Cell): int {.base, inline, locks: "unknown".} =
  cell.val

method value*(computeCell: ComputeCell): int {.inline.} =
  computeCell.calculate(computeCell.dependencies.mapIt(it.value))

proc update(cell: Cell, value: int): void =
  if value != cell.val:
    cell.val = value

    for _, callback in cell.callbacks:
      callback(cell.val)
    
    for consumer in cell.consumers:
      consumer.update(consumer.value)

proc `value=`*(inputCell: InputCell, value: int): void {.inline.} =
  inputCell.update(value)

proc newReactor*(): Reactor =
  new(result)

proc createInput*(reactor: Reactor, value: int): InputCell =
  result = InputCell(val: value, callbacks: initTable[CallbackRef, Callback](), consumers: @[])

proc createCompute*(reactor: Reactor, dependencies: seq[Cell], calculate: proc(vals: seq[int]): int): ComputeCell =
  result = ComputeCell(val: 0, callbacks: initTable[CallbackRef, Callback](), consumers: @[], dependencies: dependencies, calculate: calculate)
  result.val = result.value

  for dependency in dependencies:
    dependency.consumers.add(result)

proc addCallback*(cell: ComputeCell, cb: proc(val: int): void): CallbackRef =  
  cell.callbacks[cell.nextCallback] = cb
  cell.nextCallback.inc

proc removeCallback*(cell: ComputeCell, cbRef: CallbackRef): void =
  cell.callbacks.del(cbRef)
