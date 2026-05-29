pub fn score(x: Float, y: Float) -> Int {
  case { x *. x +. y *. y } {
    area if area <=. 1.0 -> 10
    area if area <=. 25.0 -> 5
    area if area <=. 100.0 -> 1
    _ -> 0
  }
}
