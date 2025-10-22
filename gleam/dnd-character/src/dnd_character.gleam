import gleam/int.{floor_divide, random, sum}
import gleam/list.{drop, sort}
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
    hitpoints: 10 + modifier(constitution),
    intelligence: ability(),
    strength: ability(),
    wisdom: ability(),
  )
}

pub fn modifier(score: Int) -> Int {
  floor_divide(score - 10, 2) |> unwrap(0)
}

pub fn ability() -> Int {
  let roll = fn() { random(6) + 1 }
  [roll(), roll(), roll(), roll()]
  |> sort(by: int.compare)
  |> drop(1)
  |> sum
}
