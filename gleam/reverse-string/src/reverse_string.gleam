import gleam/string

pub fn reverse(value: String) -> String {
  case string.pop_grapheme(value) {
    Error(_) -> ""
    Ok(#(first, rest)) -> reverse(rest) <> first
  }
}
