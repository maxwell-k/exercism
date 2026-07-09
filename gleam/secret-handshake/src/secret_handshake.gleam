import gleam/bool
import gleam/int
import gleam/list

pub type Command {
  Wink
  DoubleBlink
  CloseYourEyes
  Jump
}

const actions = [
  #(1, Wink),
  #(2, DoubleBlink),
  #(4, CloseYourEyes),
  #(8, Jump),
]

pub fn commands(encoded_message: Int) -> List(Command) {
  let result = {
    use acc, a <- list.fold(actions, [])
    use <- bool.guard(int.bitwise_and(encoded_message, a.0) == 0, acc)
    [a.1, ..acc]
  }

  use <- bool.guard(int.bitwise_and(encoded_message, 16) != 0, result)
  list.reverse(result)
}
