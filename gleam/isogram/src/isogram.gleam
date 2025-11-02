import gleam/list
import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  let runes =
    string.lowercase(phrase)
    |> string.split("")
    |> list.filter(fn(i) { i != " " && i != "-" })
  runes |> list.length == runes |> list.unique |> list.length
}
