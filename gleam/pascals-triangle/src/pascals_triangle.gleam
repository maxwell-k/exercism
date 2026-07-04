import gleam/bool
import gleam/int
import gleam/list
import gleam/result

pub fn rows(n: Int) -> List(List(Int)) {
  use <- bool.guard(n == 0, [])
  let earlier = rows(n - 1)
  let previous = earlier |> list.last |> result.unwrap([])
  let current =
    [0, ..previous]
    |> list.window(2)
    |> list.map(int.sum)
    |> list.reverse
  list.append(earlier, [[1, ..current]])
}
