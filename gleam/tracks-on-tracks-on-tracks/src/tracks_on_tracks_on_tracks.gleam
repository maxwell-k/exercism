import gleam/list.{fold, reverse}

pub fn new_list() -> List(String) {
  []
}

pub fn existing_list() -> List(String) {
  ["Gleam", "Go", "TypeScript"]
}

pub fn add_language(languages: List(String), language: String) -> List(String) {
  [language, ..languages]
}

pub fn count_languages(languages: List(String)) -> Int {
  fold(languages, 0, fn(acc, _) { acc + 1 })
}

pub fn reverse_list(languages: List(String)) -> List(String) {
  reverse(languages)
}

pub fn exciting_list(languages: List(String)) -> Bool {
  case languages {
    [first, ..] if first == "Gleam" -> True
    [_, second] if second == "Gleam" -> True
    [_, second, _] if second == "Gleam" -> True
    _ -> False
  }
}

pub fn main() {
  echo count_languages(["OCaml", "Elixir"])
}
