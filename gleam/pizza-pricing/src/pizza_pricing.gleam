import gleam/list

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  do_pizza_price(0, pizza)
}

pub fn do_pizza_price(accumulator: Int, pizza: Pizza) -> Int {
  case pizza {
    Margherita -> 7 + accumulator
    Caprese -> 9 + accumulator
    Formaggio -> 10 + accumulator
    ExtraSauce(inner) -> do_pizza_price(1 + accumulator, inner)
    ExtraToppings(inner) -> do_pizza_price(2 + accumulator, inner)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let additional_fee = case list.length(order) {
    1 -> 3
    2 -> 2
    _ -> 0
  }
  list.fold(order, additional_fee, do_pizza_price)
}
