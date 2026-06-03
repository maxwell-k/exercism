import gleam/list
import gleam/result
import gleam/string

pub fn distance(strand1: String, strand2: String) -> Result(Int, Nil) {
  string.to_graphemes(strand1)
  |> list.strict_zip(string.to_graphemes(strand2))
  |> result.map(fn(pairs) {
    use x <- list.count(pairs)
    x.0 != x.1
  })
}
