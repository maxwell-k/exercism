import gleam/int
import gleam/list
import gleam/string

const table = [
  #("A, E, I, O, U, L, N, R, S, T", 1),
  #("D, G", 2),
  #("B, C, M, P", 3),
  #("F, H, V, W, Y", 4),
  #("K", 5),
  #("J, X", 8),
  #("Q, Z", 10),
]

pub fn score(word: String) -> Int {
  let scores =
    table
    |> list.map(fn(x) { list.map(string.split(x.0, ", "), fn(y) { #(y, x.1) }) })
    |> list.flatten
  word
  |> string.uppercase
  |> string.to_graphemes
  |> list.filter_map(fn(x) { list.key_find(scores, x) })
  |> int.sum
}
