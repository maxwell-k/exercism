import gleam/list
import gleam/string

pub fn distance(strand1: String, strand2: String) -> Result(Int, Nil) {
  case string.length(strand1) == string.length(strand2) {
    False -> Error(Nil)
    True -> {
      Ok(
        string.to_graphemes(strand1)
        |> list.zip(string.to_graphemes(strand2))
        |> list.filter(fn(x) { x.0 != x.1 })
        |> list.length,
      )
    }
  }
}
