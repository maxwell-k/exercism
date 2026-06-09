import gleam/list
import gleam/result
import gleam/string

pub type Error {
  KeyNotCoprime(Int, Int)
}

const offset = 97

const m = 26

pub fn encode(
  plaintext plaintext: String,
  a a: Int,
  b b: Int,
) -> Result(String, Error) {
  use _ <- result.map(case is_coprime(a) {
    True -> Ok(Nil)
    False -> Error(KeyNotCoprime(a, 26))
  })
  plaintext
  |> string.lowercase
  |> string.to_utf_codepoints
  |> list.map(string.utf_codepoint_to_int)
  |> list.filter(fn(x) { x >= offset && x < offset + 26 || is_digit(x) })
  |> list.map(fn(x) {
    case is_digit(x) {
      True -> x
      False -> { a * { x - offset } + b } % m + offset
    }
  })
  |> list.map(string.utf_codepoint)
  |> result.values
  |> string.from_utf_codepoints
  |> pad
}

pub fn decode(
  ciphertext ciphertext: String,
  a a: Int,
  b b: Int,
) -> Result(String, Error) {
  use mmi <- result.map(case is_coprime(a) {
    True -> Ok(do_mmi(list.range(1, m), a))
    False -> Error(KeyNotCoprime(a, 26))
  })
  ciphertext
  |> string.replace(" ", "")
  |> string.to_utf_codepoints
  |> list.map(string.utf_codepoint_to_int)
  |> list.map(fn(x) {
    case is_digit(x) {
      True -> x
      False -> {
        let remainder = { mmi * { x - offset - b } } % m
        offset
        + remainder
        + case remainder < 0 {
          True -> m
          False -> 0
        }
      }
    }
  })
  |> list.map(string.utf_codepoint)
  |> result.values
  |> string.from_utf_codepoints
}

fn is_coprime(a: Int) {
  do_is_coprime(list.range(2, a), a)
}

fn do_is_coprime(acc: List(Int), a: Int) -> Bool {
  case acc {
    [] -> True
    [first, ..rest] ->
      case a % first == 0 && m % first == 0 {
        True -> False
        False -> do_is_coprime(rest, a)
      }
  }
}

fn pad(text: String) -> String {
  let head = string.slice(text, 0, 5)
  case string.length(text) <= 5 {
    True -> head
    False -> head <> " " <> pad(string.drop_start(text, 5))
  }
}

fn is_digit(x: Int) -> Bool {
  x >= 48 && x <= 58
}

fn do_mmi(candidates: List(Int), a: Int) -> Int {
  case candidates {
    [] -> 0
    [x, ..rest] -> {
      case { a * x } % m == 1 {
        True -> x
        False -> do_mmi(rest, a)
      }
    }
  }
}
