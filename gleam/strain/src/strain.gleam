import gleam/list

pub fn keep(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  do_keep([], list, predicate)
}

pub fn discard(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  use t <- do_keep([], list)
  !predicate(t)
}

fn do_keep(acc: List(t), list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  case list {
    [] -> list.reverse(acc)
    [first, ..rest] -> {
      do_keep(
        case predicate(first) {
          True -> [first, ..acc]
          False -> acc
        },
        rest,
        predicate,
      )
    }
  }
}
