import gleam/queue.{Queue}
import gleam/result
import gleam/pair

pub opaque type CircularBuffer(t) {
  CircularBuffer(capacity: Int, items: Queue(t))
}

pub fn new(capacity: Int) -> CircularBuffer(t) {
  CircularBuffer(capacity, queue.new())
}

pub fn read(buffer: CircularBuffer(t)) -> Result(#(t, CircularBuffer(t)), Nil) {
  result.map(
    queue.pop_front(buffer.items),
    pair.map_second(_, fn(items) { CircularBuffer(..buffer, items: items) }),
  )
}

pub fn write(
  buffer: CircularBuffer(t),
  item: t,
) -> Result(CircularBuffer(t), Nil) {
  case queue.length(buffer.items) < buffer.capacity {
    True ->
      Ok(CircularBuffer(..buffer, items: queue.push_back(buffer.items, item)))
    False -> Error(Nil)
  }
}

pub fn overwrite(buffer: CircularBuffer(t), item: t) -> CircularBuffer(t) {
  case queue.length(buffer.items) < buffer.capacity {
    True -> CircularBuffer(..buffer, items: queue.push_back(buffer.items, item))
    False -> {
      assert Ok(#(_, cleared_items)) = queue.pop_front(buffer.items)
      CircularBuffer(..buffer, items: queue.push_back(cleared_items, item))
    }
  }
}

pub fn clear(buffer: CircularBuffer(t)) -> CircularBuffer(t) {
  CircularBuffer(..buffer, items: queue.new())
}
