import gleam/bool
import gleam/string

pub type Error {
  SliceLengthTooLarge
  SliceLengthZero
  SliceLengthNegative
  EmptySeries
}

pub fn slices(input: String, size: Int) -> Result(List(String), Error) {
  use <- bool.guard(string.length(input) == 0, Error(EmptySeries))
  use <- bool.guard(size < 0, Error(SliceLengthNegative))
  use <- bool.guard(size == 0, Error(SliceLengthZero))
  use <- bool.guard(size > string.length(input), Error(SliceLengthTooLarge))
  Ok(do_slices(input, 0, size))
}

fn do_slices(input: String, start: Int, size: Int) -> List(String) {
  use <- bool.guard(start > string.length(input) - size, [])
  [string.slice(input, start, size), ..do_slices(input, start + 1, size)]
}
