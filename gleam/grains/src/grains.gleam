import gleam/int

pub type Error {
  InvalidSquare
}

pub fn square(square: Int) -> Result(Int, Error) {
  case square < 1 || square > 64 {
    False -> Ok(int.bitwise_shift_left(1, square - 1))
    True -> Error(InvalidSquare)
  }
}

pub fn total() -> Int {
  int.bitwise_shift_left(1, 64) - 1
}
