import gleam/dict
import gleam/int
import gleam/list
import gleam/string

const offsets = [
  #(-1, -1),
  #(-1, 0),
  #(-1, 1),
  #(0, -1),
  #(0, 1),
  #(1, 1),
  #(1, 0),
  #(1, -1),
]

pub fn annotate(garden: String) -> String {
  let characters = string.split(garden, "\n") |> list.map(string.to_graphemes)
  let map =
    {
      use row, y <- list.index_map(characters)
      use character, x <- list.index_map(row)
      #(#(x, y), character)
    }
    |> list.flatten
    |> dict.from_list
  let flower = fn(p: #(Int, Int)) { dict.get(map, p) == Ok("*") }
  list.index_fold(characters, "", fn(acc, row, y) {
    acc
    <> case acc == "" {
      True -> ""
      False -> "\n"
    }
    <> list.index_fold(row, "", fn(acc, char, x) {
      let count =
        list.map(offsets, fn(o) { #(x + o.0, y + o.1) }) |> list.count(flower)
      acc
      <> case char, count {
        "*", _ -> "*"
        _, 0 -> char
        _, i -> int.to_string(i)
      }
    })
  })
}
