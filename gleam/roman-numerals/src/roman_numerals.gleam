pub fn convert(number: Int) -> String {
  convert_loop(number, "")
}

fn convert_loop(number: Int, numerals: String) -> String {
  let add = fn(numeral: String, value: Int) {
    convert_loop(number - value, numerals <> numeral)
  }
  case number {
    _ if number >= 1000 -> add("M", 1000)
    _ if number >= 900 -> add("CM", 900)
    _ if number >= 500 -> add("D", 500)
    _ if number >= 400 -> add("CD", 400)
    _ if number >= 100 -> add("C", 100)
    _ if number >= 90 -> add("XC", 90)
    _ if number >= 50 -> add("L", 50)
    _ if number >= 40 -> add("XL", 40)
    _ if number >= 10 -> add("X", 10)
    _ if number >= 9 -> add("IX", 9)
    _ if number >= 5 -> add("V", 5)
    _ if number >= 4 -> add("IV", 4)
    _ if number >= 1 -> add("I", 1)
    _ -> numerals
  }
}

pub fn main() {
  echo convert(1996)
}
