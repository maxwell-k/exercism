import gleam/int
import gleam/list
import gleam/result

const squares = 64

pub type Error {
  InvalidSquare
}

pub fn square(square: Int) -> Result(Int, Error) {
  case square > 0 && square <= squares {
    True -> Ok(int.bitwise_shift_left(2, square - 2))
    False -> Error(InvalidSquare)
  }
}

pub fn total() -> Int {
  list.range(1, squares)
  |> list.try_map(square)
  |> result.unwrap([])
  |> int.sum
}
