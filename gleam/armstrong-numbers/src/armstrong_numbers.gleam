import gleam/int
import gleam/list

pub fn is_armstrong_number(number: Int) -> Bool {
  let digits = number |> do_digits([])
  digits |> list.map(power(_, list.length(digits))) |> int.sum == number
}

fn power(base: Int, exponent: Int) {
  case exponent {
    0 -> 1
    _ -> base * power(base, exponent - 1)
  }
}

fn do_digits(number: Int, acc: List(Int)) -> List(Int) {
  case number < 10 {
    True -> [number, ..acc]
    False -> do_digits(number / 10, [number % 10, ..acc])
  }
}
