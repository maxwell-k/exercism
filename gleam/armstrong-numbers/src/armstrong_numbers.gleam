import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub fn is_armstrong_number(number: Int) -> Bool {
  let text = int.to_string(number)
  let length = string.length(text)
  text
  |> string.to_graphemes
  |> list.map(int.parse)
  |> result.values
  |> list.map(power(_, length))
  |> int.sum
  == number
}

fn power(base: Int, exponent: Int) {
  case exponent {
    0 -> 1
    _ -> base * power(base, exponent - 1)
  }
}
