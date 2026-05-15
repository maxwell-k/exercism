import gleam/list
import gleam/string

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  let lowercase = word |> string.lowercase
  let arrange = fn(x) {
    string.to_graphemes(x) |> list.sort(by: string.compare)
  }
  let letters = arrange(lowercase)
  candidates
  |> list.filter(fn(mixedcase) {
    let candidate = string.lowercase(mixedcase)
    case candidate == lowercase {
      True -> False
      False -> arrange(candidate) == letters
    }
  })
}
