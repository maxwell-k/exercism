import gleam/list

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
  let find = fn(acc: Int, item: Color, index: Int) {
    acc
    + case item == color {
      True -> index
      False -> 0
    }
  }
  colors() |> list.index_fold(0, find)
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
