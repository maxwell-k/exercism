import gleam/dict.{type Dict}
import gleam/list
import gleam/string

const characters = "abcdefghijklmnopqrstuvwxyz0123456789'"

pub fn count_words(input: String) -> Dict(String, Int) {
  input
  |> unquote
  |> string.lowercase
  |> string.to_graphemes
  |> list.chunk(string.contains(characters, _))
  |> list.map(string.concat)
  |> list.filter(fn(x) { string.contains(characters, string.slice(x, 0, 1)) })
  |> list.map(unquote)
  |> list.fold(dict.new(), fn(acc, item) {
    dict.insert(acc, item, case dict.get(acc, item) {
      Error(Nil) -> 1
      Ok(x) -> x + 1
    })
  })
}

fn unquote(input: String) -> String {
  case string.slice(input, 0, 1), string.slice(input, -1, 1) {
    "'", "'" -> string.slice(input, 1, string.length(input) - 2)
    "\"", "\"" -> string.slice(input, 1, string.length(input) - 2)
    _, _ -> input
  }
}
