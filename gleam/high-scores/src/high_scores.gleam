import gleam/int
import gleam/list

pub fn scores(high_scores: List(Int)) -> List(Int) {
  high_scores
}

pub fn latest(high_scores: List(Int)) -> Result(Int, Nil) {
  case list.reverse(high_scores) {
    [first, ..] -> Ok(first)
    _ -> Error(Nil)
  }
}

fn ordered(high_scores: List(Int)) -> List(Int) {
  high_scores |> list.sort(by: int.compare) |> list.reverse
}

pub fn personal_best(high_scores: List(Int)) -> Result(Int, Nil) {
  case ordered(high_scores) {
    [first, ..] -> Ok(first)
    _ -> Error(Nil)
  }
}

pub fn personal_top_three(high_scores: List(Int)) -> List(Int) {
  high_scores |> ordered |> list.take(3)
}
