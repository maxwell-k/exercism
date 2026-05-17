import gleam/list
import gleam/string

fn separator(letter: String) -> Bool {
  case letter {
    " " | "-" | "_" -> True
    _ -> False
  }
}

// If the next item is True force the current to be False
fn last(input: List(Bool)) -> List(Bool) {
  case input {
    [first, second, ..rest] ->
      case first, second {
        _, True -> [False, ..last([True, ..rest])]
        _, _ -> [first, ..last([second, ..rest])]
      }
    _ -> input
  }
}

pub fn abbreviate(phrase phrase: String) -> String {
  let letters = phrase |> string.uppercase |> string.to_graphemes
  let separators = [" ", ..letters] |> list.map(separator) |> last
  echo list.zip(letters, separators)
    |> list.filter(fn(x) { x.1 })
    |> list.map(fn(x) { x.0 })
    |> string.join("")
}
