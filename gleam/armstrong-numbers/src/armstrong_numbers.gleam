import gleam/int
import gleam/list
import gleam/result

pub fn is_armstrong_number(number: Int) -> Bool {
  let digits = int.digits(number, 10) |> result.unwrap([])
  digits |> list.map(power(_, list.length(digits))) |> int.sum == number
}

fn power(base: Int, exponent: Int) {
  case exponent {
    0 -> 1
    _ -> base * power(base, exponent - 1)
  }
}
