import gleam/int

pub fn convert(number: Int) -> String {
  let words =
    case number {
      _ if number % 3 == 0 -> "Pling"
      _ -> ""
    }
    <> case number {
      _ if number % 5 == 0 -> "Plang"
      _ -> ""
    }
    <> case number {
      _ if number % 7 == 0 -> "Plong"
      _ -> ""
    }
  case words {
    "" -> int.to_string(number)
    i -> i
  }
}
