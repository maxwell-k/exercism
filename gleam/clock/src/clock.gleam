import gleam/int
import gleam/result

pub type Clock {
  Clock(hour: Int, minutes: Int)
}

fn above(number: Int, step: Int) -> Int {
  case number < 0 {
    True -> number |> int.modulo(step) |> result.unwrap(number)
    _ -> number
  }
}

pub fn create(hour hour: Int, minute minute: Int) -> Clock {
  let minutes = above(minute, 60)
  let contribution = int.floor_divide(minute, 60) |> result.unwrap(minute)
  Clock({ above(hour + contribution, 24) } % 24, minutes % 60)
}

pub fn add(clock: Clock, minutes minutes: Int) -> Clock {
  create(clock.hour, clock.minutes + minutes)
}

pub fn subtract(clock: Clock, minutes minutes: Int) -> Clock {
  create(clock.hour, clock.minutes - minutes)
}

fn pad(x: Int) -> String {
  case x < 10 {
    True -> "0"
    False -> ""
  }
  <> int.to_string(x)
}

pub fn display(clock: Clock) -> String {
  pad(clock.hour) <> ":" <> pad(clock.minutes)
}
