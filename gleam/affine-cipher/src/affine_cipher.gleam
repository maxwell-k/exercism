import gleam/bool
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
  use <- bool.guard(!is_coprime(a), Error(KeyNotCoprime(a, 26)))
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
  |> Ok
}

pub fn decode(
  ciphertext ciphertext: String,
  a a: Int,
  b b: Int,
) -> Result(String, Error) {
  use <- bool.guard(!is_coprime(a), Error(KeyNotCoprime(a, 26)))
  ciphertext
  |> string.replace(" ", "")
  |> string.to_utf_codepoints
  |> list.map(string.utf_codepoint_to_int)
  |> list.map(fn(x) {
    case is_digit(x) {
      True -> x
      False -> mod(mmi(a) * { x - offset - b }, m) + offset
    }
  })
  |> list.map(string.utf_codepoint)
  |> result.values
  |> string.from_utf_codepoints
  |> Ok
}

fn mod(dividend: Int, by divisor: Int) -> Int {
  case dividend % divisor {
    x if x >= 0 -> x
    x -> x + divisor
  }
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
  string.slice(text, 0, 5)
  <> case string.length(text) <= 5 {
    True -> ""
    False -> " " <> pad(string.drop_start(text, 5))
  }
}

fn is_digit(x: Int) -> Bool {
  x >= 48 && x <= 58
}

fn mmi(a: Int) {
  do_mmi(list.range(1, m), a)
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
