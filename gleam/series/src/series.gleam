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
  use <- bool.guard(size > string.length(input), Error(SliceLengthTooLarge))
  do_slices([], string.to_graphemes(input), size) |> Ok
}

fn do_slices(
  acc: List(String),
  input: List(String),
  size: Int,
) -> List(String) {
  let slice = list.take(input, size)
  case list.length(slice) == size {
    True -> do_slices([string.concat(slice), ..acc], list.drop(input, 1), size)
    False -> list.reverse(acc)
  }
}
