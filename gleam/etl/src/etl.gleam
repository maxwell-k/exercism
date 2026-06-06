import gleam/dict.{type Dict}
import gleam/list
import gleam/string

pub fn transform(legacy: Dict(Int, List(String))) -> Dict(String, Int) {
  {
    use x <- list.map(dict.to_list(legacy))
    use y <- list.map(x.1)
    #(string.lowercase(y), x.0)
  }
  |> list.flatten
  |> dict.from_list
}
