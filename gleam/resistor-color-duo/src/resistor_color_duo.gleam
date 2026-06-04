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

const ordered = [
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

fn get(list: List(a), element: a, index: Int) -> Int {
  case list {
    [] -> 0
    [first, ..] if first == element -> index
    [_, ..rest] -> get(rest, element, index + 1)
  }
}

pub fn value(colors: List(Color)) -> Result(Int, Nil) {
  case colors {
    [tens, ones, ..] -> Ok(10 * get(ordered, tens, 0) + get(ordered, ones, 0))
    _ -> Error(Nil)
  }
}
