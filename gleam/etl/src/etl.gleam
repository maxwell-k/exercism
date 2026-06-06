import gleam/dict.{type Dict}
import gleam/list
import gleam/string

pub fn transform(legacy: Dict(Int, List(String))) -> Dict(String, Int) {
  dict.from_list({
    use x <- list.flat_map(dict.to_list(legacy))
    use y <- list.map(x.1)
    #(string.lowercase(y), x.0)
  })
}
