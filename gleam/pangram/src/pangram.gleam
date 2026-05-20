import gleam/list
import gleam/string

const letters = "abcdefghijklmnopqrstuvwxyz"

pub fn is_pangram(sentence: String) -> Bool {
  sentence
  |> string.lowercase
  |> string.to_graphemes
  |> list.unique
  |> list.filter(fn(i) { string.contains(letters, i) })
  |> list.length
  == string.length(letters)
}
