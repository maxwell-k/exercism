import gleam/string

pub fn hey(remark: String) -> String {
  let trimmed = string.trim(remark)
  case
    trimmed,
    string.uppercase(trimmed) == remark && string.lowercase(trimmed) != remark,
    string.ends_with(trimmed, "?")
  {
    "", _, _ -> "Fine. Be that way!"
    _, True, True -> "Calm down, I know what I'm doing!"
    _, True, False -> "Whoa, chill out!"
    _, False, True -> "Sure."
    _, _, _ -> "Whatever."
  }
}
