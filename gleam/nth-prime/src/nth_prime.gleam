import gleam/bool

pub fn prime(number: Int) -> Result(Int, Nil) {
  use <- bool.guard(number == 0, Error(Nil))
  do_nth(2, number - 1) |> Ok
}

fn do_nth(candidate: Int, count: Int) {
  use <- bool.guard(count == 0, candidate)
  do_nth(next(candidate + 1), count - 1)
}

fn next(number: Int) {
  case do_is_prime(number, 2) {
    True -> number
    False -> next(number + 1)
  }
}

fn do_is_prime(candidate: Int, divisor: Int) {
  use <- bool.guard(divisor * divisor > candidate, True)
  case candidate % divisor == 0 {
    True -> False
    False -> do_is_prime(candidate, divisor + 1)
  }
}
