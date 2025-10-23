pub fn main() {
  echo increment_day_count([])
}

pub fn today(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [first, ..] -> first
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [] -> [1]
    [first, ..rest] -> [first + 1, ..rest]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case days {
    [] -> False
    [0, ..] -> True
    [_, ..rest] -> has_day_without_birds(rest)
  }
}

// The two lines below are sufficient however the concept for the exercise is recursion
// import gleam/int
// pub const total = int.sum
pub fn total(days: List(Int)) {
  do_total(days, 0)
}

fn do_total(days: List(Int), accumulator: Int) -> Int {
  case days {
    [first, ..rest] -> do_total(rest, accumulator + first)
    [] -> accumulator
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  do_busy_days(days, 0)
}

fn do_busy_days(days: List(Int), count: Int) -> Int {
  case days {
    [] -> count
    [first, ..rest] if first >= 5 -> do_busy_days(rest, count + 1)
    [_, ..rest] -> do_busy_days(rest, count)
  }
}
