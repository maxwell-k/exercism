import gleam/dict.{type Dict}
import gleam/list
import gleam/option.{None, Some}
import gleam/string

fn in_word(grapheme: String) -> Bool {
  string.contains("abcdefghijklmnopqrstuvwxyz0123456789'", grapheme)
}

pub fn count_words(input: String) -> Dict(String, Int) {
  input
  |> unquote
  |> string.lowercase
  |> string.to_graphemes
  |> list.chunk(in_word)
  |> list.map(string.concat)
  |> list.filter(fn(x) { in_word(string.slice(x, 0, 1)) })
  |> list.map(unquote)
  |> list.fold(dict.new(), fn(acc, e) {
    dict.upsert(acc, e, fn(x) {
      case x {
        Some(i) -> i
        None -> 0
      }
      + 1
    })
  })
}

fn unquote(input: String) -> String {
  case string.slice(input, 0, 1), string.slice(input, -1, 1) {
    "'", "'" | "\"", "\"" -> string.slice(input, 1, string.length(input) - 2)
    _, _ -> input
  }
}
