import gleam/bool
import gleam/list
import gleam/string

pub type Error {
  SliceLengthTooLarge
  SliceLengthZero
  SliceLengthNegative
  EmptySeries
}

pub fn slices(input: String, size: Int) -> Result(List(String), Error) {
  use <- bool.guard(input == "", Error(EmptySeries))
  use <- bool.guard(size < 0, Error(SliceLengthNegative))
  use <- bool.guard(size == 0, Error(SliceLengthZero))
  let length = string.length(input)
  use <- bool.guard(size > length, Error(SliceLengthTooLarge))

  list.range(0, length - size)
  |> list.map(string.slice(input, _, size))
  |> Ok
}
