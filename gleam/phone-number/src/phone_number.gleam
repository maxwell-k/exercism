import gleam/bool
import gleam/regexp
import gleam/result
import gleam/string

pub fn clean(input: String) -> Result(String, String) {
  use <- bool.guard(check(input, "[a-zA-Z]"), Error("letters not permitted"))
  use <- bool.guard(check(input, "[@:!]"), Error("punctuations not permitted"))
  let no_punctuation = delete_all(input, "() -.")
  let no_cc = case string.length(no_punctuation), no_punctuation {
    12, "+1" <> rest -> Ok(rest)
    i, _ if i > 11 -> Error("must not be greater than 11 digits")
    11, "1" <> rest -> Ok(rest)
    11, _ -> Error("11 digits must start with 1")
    10, x -> Ok(x)
    _, _ -> Error("must not be fewer than 10 digits")
  }
  case result.map(no_cc, string.to_graphemes) {
    Ok(["0", ..]) -> Error("area code cannot start with zero")
    Ok(["1", ..]) -> Error("area code cannot start with one")
    Ok([_, _, _, "0", ..]) -> Error("exchange code cannot start with zero")
    Ok([_, _, _, "1", ..]) -> Error("exchange code cannot start with one")
    Ok(x) -> Ok(string.concat(x))
    Error(x) -> Error(x)
  }
}

fn check(input: String, regular_expression: String) -> Bool {
  case regexp.from_string(regular_expression) {
    Ok(re) -> regexp.check(re, input)
    _ -> False
  }
}

fn delete_all(input: String, substring: String) -> String {
  case string.pop_grapheme(substring) {
    Error(Nil) -> input
    Ok(#(first, rest)) -> delete_all(string.replace(input, first, ""), rest)
  }
}
