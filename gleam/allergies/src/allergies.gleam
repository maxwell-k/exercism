import gleam/int
import gleam/list
import gleam/result

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
  #(Eggs, 0),
  #(Peanuts, 1),
  #(Shellfish, 2),
  #(Strawberries, 3),
  #(Tomatoes, 4),
  #(Chocolate, 5),
  #(Pollen, 6),
  #(Cats, 7),
]

pub fn allergic_to(allergen: Allergen, score: Int) -> Bool {
  let index =
    list.key_find(allergens, allergen) |> result.unwrap(list.length(allergens))
  score
  |> int.bitwise_shift_right(index)
  |> int.bitwise_and(1)
  == 1
}

pub fn list(score: Int) -> List(Allergen) {
  allergens
  |> list.map(fn(x) { x.0 })
  |> list.filter(fn(allergen) { allergic_to(allergen, score) })
}
