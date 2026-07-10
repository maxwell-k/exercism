import gleam/bool
import gleam/result

pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  use <- bool.guard(number < 1, Error(NonPositiveNumber))
  use <- bool.guard(number == 1, Ok(0))
  use count <- result.map(
    steps(case number % 2 {
      0 -> number / 2
      _ -> 3 * number + 1
    }),
  )
  count + 1
}
