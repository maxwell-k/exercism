import gleam/list
import gleam/result

pub type Color {
  Black
  Brown
  Red
  Orange
  Yellow
  Green
  Blue
  Violet
  Grey
  White
}

pub fn code(color: Color) -> Int {
  colors()
  |> list.index_map(fn(b, i) { #(b, i) })
  |> list.key_find(color)
  |> result.unwrap(0)
}

pub fn colors() -> List(Color) {
  [
    Black,
    Brown,
    Red,
    Orange,
    Yellow,
    Green,
    Blue,
    Violet,
    Grey,
    White,
  ]
}
