import gleam/bool
import gleam/list

pub fn factors(value: Int) -> List(Int) {
  do_factors([], 2, value) |> list.reverse
}

fn do_factors(result: List(Int), divisor: Int, remainder: Int) -> List(Int) {
  use <- bool.guard(remainder == 1, result)
  case remainder % divisor == 0 {
    True -> do_factors([divisor, ..result], divisor, remainder / divisor)
    False -> do_factors(result, divisor + 1, remainder)
  }
}
