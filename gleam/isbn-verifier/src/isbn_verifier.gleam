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
  let digits =
    case string.length(without_hyphens) {
      10 -> without_hyphens |> string.to_graphemes |> parse
      _ -> [Error(Nil)]
    }
    |> result.all
  case digits {
    Ok(x) -> {
      0 == { x |> list.index_map(fn(x, i) { x * { 10 - i } }) |> int.sum } % 11
    }
    _ -> False
  }
}
