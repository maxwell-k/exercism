import gleam/bool

pub fn prime(number: Int) -> Result(Int, Nil) {
  use <- bool.guard(number < 1, Error(Nil))
  do_prime(2, number - 1) |> Ok
}

fn do_prime(candidate: Int, remaining: Int) {
  use <- bool.guard(remaining == 0, candidate)
  do_prime(next_prime_greater_or_equal(candidate + 1), remaining - 1)
}

fn next_prime_greater_or_equal(number: Int) {
  use <- bool.guard(is_prime(number, 2), number)
  next_prime_greater_or_equal(number + 1)
}

fn is_prime(candidate: Int, divisor: Int) {
  use <- bool.guard(divisor * divisor > candidate, True)
  use <- bool.guard(candidate % divisor == 0, False)
  is_prime(candidate, divisor + 1)
}
