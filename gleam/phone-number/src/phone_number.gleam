import gleam/bool
import gleam/list
import gleam/string

pub fn punctuation(input: List(String)) -> Bool {
  use i <- list.any(input)
  case i {
    "@" | ":" | "!" -> True
    _ -> False
  }
}

pub fn letters(input: List(String)) -> Bool {
  use i <- list.any(input)
  case i {
    "a"
    | "b"
    | "c"
    | "d"
    | "e"
    | "f"
    | "g"
    | "h"
    | "i"
    | "j"
    | "k"
    | "l"
    | "m"
    | "n"
    | "o"
    | "p"
    | "q"
    | "r"
    | "s"
    | "t"
    | "u"
    | "v"
    | "w"
    | "x"
    | "y"
    | "z" -> True
    _ -> False
  }
}

pub fn clean(input: String) -> Result(String, String) {
  let cleaned = {
    use i <- list.filter(
      case input {
        "+1" <> rest -> "1" <> rest
        x -> x
      }
      |> string.lowercase
      |> string.to_graphemes,
    )
    case i {
      "(" | ")" | " " | "-" | "." -> False
      _ -> True
    }
  }
  use <- bool.guard(punctuation(cleaned), Error("punctuations not permitted"))
  use <- bool.guard(letters(cleaned), Error("letters not permitted"))
  let length = list.length(cleaned)
  use <- bool.guard(length > 11, Error("must not be greater than 11 digits"))
  let no_country_code = length == 11 && list.take(cleaned, 1) != ["1"]
  use <- bool.guard(no_country_code, Error("11 digits must start with 1"))
  use <- bool.guard(length < 10, Error("must not be fewer than 10 digits"))

  let result = case length, cleaned {
    11, ["1", ..rest] -> rest
    _, x -> x
  }
  let start1 = result |> list.take(1)
  use <- bool.guard(start1 == ["0"], Error("area code cannot start with zero"))
  use <- bool.guard(start1 == ["1"], Error("area code cannot start with one"))
  let start2 = result |> list.drop(3) |> list.take(1)
  use <- bool.guard(
    start2 == ["0"],
    Error("exchange code cannot start with zero"),
  )
  use <- bool.guard(
    start2 == ["1"],
    Error("exchange code cannot start with one"),
  )
  Ok(string.concat(result))
}

pub fn main() {
  clean("+1 (223) 456-7890") |> echo
}
