import gleam/list
import gleam/string

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  let lowercase = word |> string.lowercase
  let letters =
    lowercase |> string.to_graphemes |> list.sort(by: string.compare)
  candidates
  |> list.filter(fn(candidate) {
    candidate
    |> string.lowercase
    |> string.to_graphemes
    |> list.sort(by: string.compare)
    == letters
  })
  |> list.filter(fn(candidate) { string.lowercase(candidate) != lowercase })
}
