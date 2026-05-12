import gleam/dict.{type Dict}
import gleam/int
import gleam/list
import gleam/string

pub fn nucleotide_count(dna: String) -> Result(Dict(String, Int), Nil) {
  let sequence = string.to_graphemes(dna)
  let count = fn(nucleotide) { list.count(sequence, fn(i) { i == nucleotide }) }
  let counts = list.map(["A", "C", "G", "T"], fn(x) { #(x, count(x)) })
  case counts |> list.map(fn(x) { x.1 }) |> int.sum == string.length(dna) {
    True -> Ok(dict.from_list(counts))
    False -> Error(Nil)
  }
}
