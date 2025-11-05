import gleam/list
import gleam/set

fn valid(a: Float, b: Float, c: Float) {
  list.all([a, b, c], fn(i) { i >. 0.0 })
  && a <. { b +. c }
  && b <. { a +. c }
  && c <. { a +. b }
}

fn lengths(a: Float, b: Float, c: Float) -> Int {
  set.from_list([a, b, c]) |> set.size
}

pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  valid(a, b, c) && lengths(a, b, c) == 1
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  valid(a, b, c) && lengths(a, b, c) <= 2
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  valid(a, b, c) && lengths(a, b, c) == 3
}
