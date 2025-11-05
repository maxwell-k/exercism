import gleam/list
import gleam/string

const brackets = "{}[]()"

fn paired(open: List(String), brackets: List(String)) {
  case open, brackets {
    [], [] -> True
    ["{", ..open1], ["}", ..brackets1] -> paired(open1, brackets1)
    ["[", ..open1], ["]", ..brackets1] -> paired(open1, brackets1)
    ["(", ..open1], [")", ..brackets1] -> paired(open1, brackets1)
    _, ["(", ..brackets1] -> paired(["(", ..open], brackets1)
    _, ["{", ..brackets1] -> paired(["{", ..open], brackets1)
    _, ["[", ..brackets1] -> paired(["[", ..open], brackets1)
    _, _ -> False
  }
}

pub fn is_paired(value: String) -> Bool {
  value
  |> string.to_graphemes()
  |> list.filter(string.contains(brackets, _))
  |> paired([], _)
}
