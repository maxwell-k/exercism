import gleam/list
import gleam/result
import gleam/string
import simplifile

pub fn read_emails(path: String) -> Result(List(String), Nil) {
  simplifile.read(path)
  |> result.map(string.trim)
  |> result.map(fn(i) { string.split(i, "\n") })
  |> result.map_error(fn(_) { Nil })
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
  simplifile.create_file(path)
  |> result.map_error(fn(_) { Nil })
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
  simplifile.append(email <> "\n", to: path)
  |> result.map_error(fn(_) { Nil })
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  create_log_file(log_path)
  |> result.try(fn(_) { read_emails(emails_path) })
  |> result.try(fn(emails) {
    emails
    |> list.map(fn(email) {
      send_email(email)
      |> result.map(fn(_) { log_sent_email(log_path, email) })
    })
    Ok(Nil)
  })
}
