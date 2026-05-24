import gleam/int
import gleam/list
import gleam/result
import gleam/string

fn parse(characters: List(String)) -> List(Result(Int, Nil)) {
  case characters {
    [] -> []
    ["X"] -> [Ok(10)]
    [first, ..rest] -> [int.parse(first), ..parse(rest)]
  }
}

pub fn is_valid(isbn: String) -> Bool {
  let without_hyphens = isbn |> string.replace("-", "")
  case string.length(without_hyphens) {
    10 -> without_hyphens |> string.to_graphemes |> parse
    _ -> [Error(Nil)]
  }
  |> result.all
  |> result.map(list.index_map(_, fn(x, i) { x * { 10 - i } }))
  |> result.map(int.sum)
  |> result.map(fn(i) { i % 11 == 0 })
  |> result.unwrap(False)
}
