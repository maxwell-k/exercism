import gleam/dict.{type Dict}
import gleam/list
import gleam/string

pub fn transform(legacy: Dict(Int, List(String))) -> Dict(String, Int) {
  use result, score, letters <- dict.fold(legacy, dict.new())
  use result, letter <- list.fold(letters, result)
  dict.insert(result, string.lowercase(letter), score)
}
