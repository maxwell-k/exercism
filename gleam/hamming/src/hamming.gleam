import gleam/list
import gleam/result
import gleam/string

pub fn distance(strand1: String, strand2: String) -> Result(Int, Nil) {
  use zipped <- result.map(list.strict_zip(
    string.to_graphemes(strand1),
    string.to_graphemes(strand2),
  ))
  use item <- list.count(zipped)
  item.0 != item.1
}
