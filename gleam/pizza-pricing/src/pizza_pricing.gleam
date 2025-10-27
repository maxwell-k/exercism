import gleam/list

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(inner) -> 1 + pizza_price(inner)
    ExtraToppings(inner) -> 2 + pizza_price(inner)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  case list.length(order) {
    1 -> 3
    2 -> 2
    _ -> 0
  }
  + sum_pizza_prices(order, 0)
}

fn sum_pizza_prices(order: List(Pizza), accumulator: Int) -> Int {
  case order {
    [] -> accumulator
    [first, ..rest] -> sum_pizza_prices(rest, accumulator + pizza_price(first))
  }
}
