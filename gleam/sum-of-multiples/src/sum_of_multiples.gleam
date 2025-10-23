import gleam/int
import gleam/list

fn factors_filter(factors: List(Int)) -> fn(Int) -> Bool {
  let positive_factors = list.filter(factors, fn(i) { i > 0 })
  fn(n) { list.any(positive_factors, fn(factor) { n % factor == 0 }) }
}

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  list.range(1, limit - 1) |> list.filter(factors_filter(factors)) |> int.sum
}
