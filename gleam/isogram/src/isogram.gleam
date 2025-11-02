import gleam/list
import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  let runes =
    string.lowercase(phrase)
    |> string.to_graphemes
    |> list.filter(fn(i) { !string.contains(" -", i) })
  runes |> list.length == runes |> list.unique |> list.length
}
