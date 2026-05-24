pub fn egg_count(number: Int) -> Int {
  do_egg_count(number, 0)
}

fn do_egg_count(number: Int, acc acc: Int) -> Int {
  let remainder = number % 2
  case number < 2 {
    True -> acc + remainder
    False -> do_egg_count(number / 2, acc + remainder)
  }
}
