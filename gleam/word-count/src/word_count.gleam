import gleam/dict.{type Dict}
import gleam/list
import gleam/string

const not_separator = "abcdefghijklmnopqrstuvwxyz0123456789'"

pub fn count_words(input: String) -> Dict(String, Int) {
  let words =
    input
    |> unquote
    |> string.lowercase
    |> split_words
    |> list.map(unquote)
  words
  |> list.unique
  |> list.map(fn(x) { #(x, words |> list.count(fn(y) { x == y })) })
  |> dict.from_list
}

fn first_word(input: String) -> String {
  case string.pop_grapheme(input) {
    Ok(#(first, rest)) ->
      case string.contains(not_separator, first) {
        True -> first <> first_word(rest)
        False -> ""
      }
    Error(Nil) -> ""
  }
}

fn unquote(input: String) -> String {
  case string.slice(input, 0, 1), string.slice(input, -1, 1) {
    "'", "'" -> string.slice(input, 1, string.length(input) - 2)
    "\"", "\"" -> string.slice(input, 1, string.length(input) - 2)
    _, _ -> input
  }
}

fn split_words(input: String) -> List(String) {
  case input {
    "" -> []
    _ -> {
      case first_word(input) {
        "" -> split_words(string.drop_start(input, 1))
        w -> [w, ..split_words(string.drop_start(input, string.length(w) + 1))]
      }
    }
  }
}
