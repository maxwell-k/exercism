import gleam/float

pub fn score(x: Float, y: Float) -> Int {
  case { x *. x +. y *. y } |> float.square_root {
    Ok(r) if r <=. 1.0 -> 10
    Ok(r) if r <=. 5.0 -> 5
    Ok(r) if r <=. 10.0 -> 1
    _ -> 0
  }
}
