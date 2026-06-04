import gleam/list

const length = 2

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

fn do_index_of(list: List(a), element: a, index: Int) -> Int {
  case list {
    [] -> 0
    [first, ..] if first == element -> index
    [_, ..rest] -> do_index_of(rest, element, index + 1)
  }
}

fn power(base: Int, exponent: Int) {
  case exponent {
    0 -> 1
    _ -> base * power(base, exponent - 1)
  }
}

pub fn value(colors: List(Color)) -> Result(Int, Nil) {
  let values = {
    use x, i <- list.index_map(list.take(colors, length))
    do_index_of(ordered, x, 0) * power(10, length - i - 1)
  }
  case list.length(colors) {
    i if i < length -> Error(Nil)
    _ ->
      Ok({
        use acc, x <- list.fold(values, 0)
        acc + x
      })
  }
}
