import gleam/int
import gleam/list

pub type Command {
  Wink
  DoubleBlink
  CloseYourEyes
  Jump
}

pub fn commands(encoded_message: Int) -> List(Command) {
  let result =
    list.flatten([
      check(encoded_message, 1, Wink),
      check(encoded_message, 2, DoubleBlink),
      check(encoded_message, 4, CloseYourEyes),
      check(encoded_message, 8, Jump),
    ])
  case int.bitwise_and(encoded_message, 16) == 16 {
    True -> list.reverse(result)
    False -> result
  }
}

fn check(encoded_message: Int, value: Int, command: Command) -> List(Command) {
  case int.bitwise_and(encoded_message, value) == value {
    True -> [command]
    False -> []
  }
}
