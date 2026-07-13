import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub type P {
  P(x: Int, y: Int)
}

const offsets = [
  P(-1, -1),
  P(-1, 0),
  P(-1, 1),
  P(0, -1),
  P(0, 1),
  P(1, 1),
  P(1, 0),
  P(1, -1),
]

pub fn annotate(garden: String) -> String {
  let parsed = {
    use value, y <- list.index_map(string.split(garden, "\n"))
    use value, x <- list.index_map(string.to_graphemes(value))
    #(P(x, y), value)
  }

  let flower = fn(x) { x == "*" }
  let rows = list.range(0, list.length(parsed) - 1)
  let columns =
    list.range(0, list.length(result.unwrap(list.first(parsed), [])) - 1)
  let in_garden = fn(p: P) {
    list.contains(rows, p.y) && list.contains(columns, p.x)
  }
  let haystack = list.flatten(parsed)
  let lookup = fn(p: P) { list.key_find(haystack, p) |> result.unwrap("") }
  list.map(rows, fn(y) {
    list.map(columns, fn(x) {
      let original = lookup(P(x, y))
      let count =
        list.map(offsets, fn(o) { P(x + o.x, y + o.y) })
        |> list.filter(in_garden)
        |> list.map(lookup)
        |> list.count(flower)
      case original, count {
        "*", _ -> "*"
        _, 0 -> original
        _, _ -> int.to_string(count)
      }
    })
    |> string.join("")
  })
  |> string.join("\n")
}
