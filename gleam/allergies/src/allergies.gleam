import gleam/int

pub type Allergen {
  Eggs
  Peanuts
  Shellfish
  Strawberries
  Tomatoes
  Chocolate
  Pollen
  Cats
}

const allergens = [
  Eggs,
  Peanuts,
  Shellfish,
  Strawberries,
  Tomatoes,
  Chocolate,
  Pollen,
  Cats,
]

fn index(allergen: Allergen) -> Int {
  case allergen {
    Eggs -> 0
    Peanuts -> 1
    Shellfish -> 2
    Strawberries -> 3
    Tomatoes -> 4
    Chocolate -> 5
    Pollen -> 6
    Cats -> 7
  }
}

pub fn allergic_to(allergen: Allergen, score: Int) -> Bool {
  score
  |> int.bitwise_shift_right(index(allergen))
  |> int.bitwise_and(1)
  == 1
}

pub fn list(score: Int) -> List(Allergen) {
  do_list(score, allergens)
}

fn do_list(score: Int, allergens: List(Allergen)) -> List(Allergen) {
  case allergens {
    [first, ..rest] ->
      case allergic_to(first, score) {
        True -> [first, ..do_list(score, rest)]
        False -> do_list(score, rest)
      }
    [] -> []
  }
}
