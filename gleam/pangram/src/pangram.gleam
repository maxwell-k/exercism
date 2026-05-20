import gleam/list
import gleam/string

pub fn is_pangram(sentence: String) -> Bool {
  sentence
  |> string.lowercase
  |> string.to_graphemes
  |> list.unique
  |> list.filter(fn(i) { list.contains(letters, i) })
  |> list.length
  == length
}

const letters = [
  "a",
  "b",
  "c",
  "d",
  "e",
  "f",
  "g",
  "h",
  "i",
  "j",
  "k",
  "l",
  "m",
  "n",
  "o",
  "p",
  "q",
  "r",
  "s",
  "t",
  "u",
  "v",
  "w",
  "x",
  "y",
  "z",
]

const length = 26
