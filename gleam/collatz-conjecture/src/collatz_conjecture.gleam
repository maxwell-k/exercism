import gleam/bool

pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  use <- bool.guard(number < 1, Error(NonPositiveNumber))
  do_steps(number, 0) |> Ok
}

fn do_steps(number: Int, result: Int) -> Int {
  use <- bool.guard(number == 1, result)
  do_steps(
    case number % 2 {
      0 -> number / 2
      _ -> 3 * number + 1
    },
    result + 1,
  )
}
