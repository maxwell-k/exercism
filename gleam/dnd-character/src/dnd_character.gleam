import gleam/int.{add, floor_divide, random}
import gleam/list.{drop, fold, sort}
import gleam/result.{unwrap}

pub type Character {
  Character(
    charisma: Int,
    constitution: Int,
    dexterity: Int,
    hitpoints: Int,
    intelligence: Int,
    strength: Int,
    wisdom: Int,
  )
}

pub fn generate_character() -> Character {
  let constitution = ability()
  Character(
    charisma: ability(),
    constitution:,
    dexterity: ability(),
    intelligence: ability(),
    strength: ability(),
    wisdom: ability(),
    hitpoints: 10 + modifier(constitution),
  )
}

pub fn modifier(score: Int) -> Int {
  unwrap(floor_divide(score - 10, 2), 0)
}

pub fn ability() -> Int {
  let roll = fn() { random(6) + 1 }
  [roll(), roll(), roll(), roll()]
  |> sort(by: int.compare)
  |> drop(1)
  |> fold(0, add)
}
