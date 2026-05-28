import gleam/int

pub type Clock {
  Clock(minutes: Int)
}

// 24 * 60
const day = 1440

fn modulo_day(dividend: Int) -> Int {
  let remainder = dividend % day
  remainder
  + case remainder < 0 {
    True -> day
    False -> 0
  }
}

pub fn create(hour hour: Int, minute minute: Int) -> Clock {
  Clock({ hour * 60 + minute } |> modulo_day)
}

pub fn add(clock: Clock, minutes minutes: Int) -> Clock {
  Clock({ clock.minutes + minutes } |> modulo_day)
}

pub fn subtract(clock: Clock, minutes minutes: Int) -> Clock {
  Clock({ clock.minutes - minutes } |> modulo_day)
}

fn pad(x: Int) -> String {
  case x < 10 {
    True -> "0"
    False -> ""
  }
  <> int.to_string(x)
}

pub fn display(clock: Clock) -> String {
  pad(clock.minutes / 60) <> ":" <> pad(clock.minutes % 60)
}
