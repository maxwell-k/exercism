import gleam/int
import gleam/list
import gleam/result

pub fn rows(n: Int) -> List(List(Int)) {
  case n {
    0 -> []
    1 -> [[1]]
    _ -> {
      let earlier = rows(n - 1)
      let current =
        earlier
        |> list.last
        |> result.unwrap([])
        |> list.window(2)
        |> list.map(int.sum)
        |> list.append([1])
      list.append(earlier, [[1, ..current]])
    }
  }
}
