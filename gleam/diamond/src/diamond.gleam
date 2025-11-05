import gleam/list
import gleam/string

const alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

pub fn build(letter: String) -> String {
  let included =
    case string.split_once(alphabet, letter) {
      Ok(i) -> i.0
      _ -> ""
    }
    <> letter
  let letters = string.length(included)
  let line = fn(letter: String, index: Int) {
    let padding = string.repeat(" ", letters - index - 1)
    padding
    <> case letter {
      "A" -> "A"
      _ -> letter <> string.repeat(" ", 2 * index - 1) <> letter
    }
    <> padding
  }
  let start =
    string.to_graphemes(included)
    |> list.index_map(line)
  let end = list.reverse(start) |> list.drop(1)
  start |> list.append(end) |> string.join("\n")
}
