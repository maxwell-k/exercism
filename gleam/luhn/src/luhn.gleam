import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub fn valid(value: String) -> Bool {
  let digits =
    value
    |> string.replace(" ", "")
    |> string.split("")
    |> list.map(int.parse)
    |> result.all
    |> result.unwrap([])
  let sum =
    digits
    |> list.reverse
    |> list.index_map(fn(value, index) {
      value
      * case index % 2 {
        0 -> 1
        _ -> 2
      }
    })
    |> list.map(fn(x) {
      case x > 9 {
        True -> x - 9
        False -> x
      }
    })
    |> int.sum
  case list.length(digits) {
    0 -> False
    1 -> False
    _ -> sum % 10 == 0
  }
}
