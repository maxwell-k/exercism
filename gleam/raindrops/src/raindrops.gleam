import gleam/int

pub fn convert(number: Int) -> String {
  let words =
    case number % 3 {
      0 -> "Pling"
      _ -> ""
    }
    <> case number % 5 {
      0 -> "Plang"
      _ -> ""
    }
    <> case number % 7 {
      0 -> "Plong"
      _ -> ""
    }
  case words {
    "" -> int.to_string(number)
    i -> i
  }
}
