import gleam/list
import gleam/result
import gleam/string

const a = 65

fn to_position(letter: String) -> Int {
  // use zero indexed alphabet A=0, B=1, C=2…
  {
    letter
    |> string.to_utf_codepoints
    |> list.first
    |> result.map(string.utf_codepoint_to_int)
    |> result.unwrap(a)
  }
  - a
}

fn from_position(position: Int) -> String {
  string.utf_codepoint(a + position)
  |> result.map(list.wrap)
  |> result.map(string.from_utf_codepoints)
  |> result.unwrap("A")
}

fn text(position: Int) -> String {
  let letter = from_position(position)
  case position {
    0 -> letter
    _ -> letter <> string.repeat(" ", 2 * position - 1) <> letter
  }
}

pub fn build(letter: String) -> String {
  let max = to_position(letter)
  let padding = fn(i) { string.repeat(" ", max - i) }
  positions(max)
  |> list.map(fn(i) { padding(i) <> text(i) <> padding(i) })
  |> string.join("\n")
}

fn positions(max: Int) -> List(Int) {
  case max {
    0 -> [0]
    _ ->
      list.range(0, max)
      |> list.append(list.range(max - 1, 0))
  }
}
