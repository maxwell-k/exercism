pub fn egg_count(number: Int) -> Int {
  do_egg_count(number, 0)
}

fn do_egg_count(number: Int, acc acc: Int) -> Int {
  case number {
    0 -> acc
    _ -> do_egg_count(number / 2, acc + number % 2)
  }
}
