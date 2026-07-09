import gleam/list

pub fn keep(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  do_keep([], True, list, predicate)
}

pub fn discard(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  do_keep([], False, list, predicate)
}

fn do_keep(
  acc: List(t),
  expected: Bool,
  list: List(t),
  predicate: fn(t) -> Bool,
) -> List(t) {
  case list {
    [] -> list.reverse(acc)
    [first, ..rest] -> {
      case predicate(first) == expected {
        True -> do_keep([first, ..acc], expected, rest, predicate)
        False -> do_keep(acc, expected, rest, predicate)
      }
    }
  }
}
