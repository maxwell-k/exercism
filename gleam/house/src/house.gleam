fn lookup(number: Int) -> #(String, String) {
  case number {
    1 -> #("house", "")
    2 -> #("malt", "lay in")
    3 -> #("rat", "ate")
    4 -> #("cat", "killed")
    5 -> #("dog", "worried")
    6 -> #("cow with the crumpled horn", "tossed")
    7 -> #("maiden all forlorn", "milked")
    8 -> #("man all tattered and torn", "kissed")
    9 -> #("priest all shaven and shorn", "married")
    10 -> #("rooster that crowed in the morn", "woke")
    11 -> #("farmer sowing his corn", "kept")
    _ -> #("horse and the hound and the horn", "belonged to")
  }
}

fn do_verse(acc: String, number: Int) -> String {
  let #(noun, verb) = lookup(number)
  let phrase =
    noun
    <> " that "
    <> verb
    <> case number {
      1 -> "Jack built."
      _ -> " the "
    }
  acc
  <> case number < 1 {
    True -> ""
    False -> do_verse(phrase, number - 1)
  }
}

pub fn recite(
  start_verse start_verse: Int,
  end_verse end_verse: Int,
) -> String {
  case start_verse == end_verse {
    True -> ""
    False -> recite(start_verse, end_verse - 1) <> "\n"
  }
  <> do_verse("This is the ", end_verse)
}
