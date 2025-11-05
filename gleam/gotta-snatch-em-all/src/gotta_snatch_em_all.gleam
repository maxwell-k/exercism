import gleam/list
import gleam/set.{type Set}
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.new() |> set.insert(card)
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  #(set.contains(collection, card), set.insert(collection, card))
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let possible = set.contains(collection, my_card)
  let worth_doing = !set.contains(collection, their_card)
  let result = set.insert(collection, their_card) |> set.delete(my_card)
  #(possible && worth_doing, result)
}

fn all_cards(collections: List(Set(String))) -> Set(String) {
  collections
  |> list.map(set.to_list)
  |> list.flatten
  |> set.from_list
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  let all = fn(card) {
    list.all(collections, fn(collection) { set.contains(collection, card) })
  }
  collections
  |> all_cards
  |> set.to_list
  |> list.filter(all)
  |> list.sort(string.compare)
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  collections
  |> all_cards
  |> set.size
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  set.filter(collection, fn(x) {
    case x {
      "Shiny " <> _ -> True
      _ -> False
    }
  })
}
