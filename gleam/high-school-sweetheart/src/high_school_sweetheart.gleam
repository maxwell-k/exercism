import gleam/result
import gleam/string

pub fn first_letter(name: String) {
  name |> string.trim |> string.first |> result.unwrap("")
}

pub fn initial(name: String) {
  name |> first_letter |> string.uppercase <> "."
}

pub fn initials(full_name: String) {
  let last = full_name |> string.crop(" ")
  initial(full_name) <> " " <> initial(last)
}

pub fn pair(full_name1: String, full_name2: String) {
  let line_with_initials =
    "**     "
    <> initials(full_name1)
    <> "  +  "
    <> initials(full_name2)
    <> "     **\n"

  "\n"
  <> "     ******       ******\n"
  <> "   **      **   **      **\n"
  <> " **         ** **         **\n"
  <> "**            *            **\n"
  <> "**                         **\n"
  <> line_with_initials
  <> " **                       **\n"
  <> "   **                   **\n"
  <> "     **               **\n"
  <> "       **           **\n"
  <> "         **       **\n"
  <> "           **   **\n"
  <> "             ***\n"
  <> "              *\n"
}
