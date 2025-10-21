import gleam/string.{ends_with, lowercase, trim, uppercase}

pub fn hey(remark: String) -> String {
  let trimmed = trim(remark)
  let is_yell = uppercase(trimmed) == remark && lowercase(trimmed) != remark
  case trimmed, is_yell, ends_with(trimmed, "?") {
    "", _, _ -> "Fine. Be that way!"
    _, True, True -> "Calm down, I know what I'm doing!"
    _, True, False -> "Whoa, chill out!"
    _, False, True -> "Sure."
    _, _, _ -> "Whatever."
  }
}
