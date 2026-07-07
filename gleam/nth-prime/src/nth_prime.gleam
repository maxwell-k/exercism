import gleam/bool

pub fn prime(number: Int) -> Result(Int, Nil) {
  use <- bool.guard(number == 0, Error(Nil))
  do_nth(2, number - 1) |> Ok
}

fn do_nth(candidate: Int, remaining: Int) {
  use <- bool.guard(remaining == 0, candidate)
  do_nth(next(candidate + 1), remaining - 1)
}

fn next(number: Int) {
  use <- bool.guard(do_is_prime(number, 2), number)
  next(number + 1)
}

fn do_is_prime(candidate: Int, divisor: Int) {
  use <- bool.guard(divisor * divisor > candidate, True)
  use <- bool.guard(candidate % divisor == 0, False)
  do_is_prime(candidate, divisor + 1)
}
