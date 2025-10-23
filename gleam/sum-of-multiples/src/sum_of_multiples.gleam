import gleam/int
import gleam/list

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  let multiples = fn(factor: Int) {
    list.range(1, limit - 1)
    |> list.filter(fn(x) { x % factor == 0 })
  }
  factors
  |> list.filter(fn(x) { x > 0 })
  |> list.map(multiples)
  |> list.flatten
  |> list.unique
  |> int.sum
}
