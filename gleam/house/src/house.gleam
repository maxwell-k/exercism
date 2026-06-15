fn do_phrase(acc: String, verse: Int) -> String {
  let phrase = case verse {
    1 -> "house that Jack built."
    2 -> "malt that lay in the "
    3 -> "rat that ate the "
    4 -> "cat that killed the "
    5 -> "dog that worried the "
    6 -> "cow with the crumpled horn that tossed the "
    7 -> "maiden all forlorn that milked the "
    8 -> "man all tattered and torn that kissed the "
    9 -> "priest all shaven and shorn that married the "
    10 -> "rooster that crowed in the morn that woke the "
    11 -> "farmer sowing his corn that kept the "
    _ -> "horse and the hound and the horn that belonged to the "
  }
  acc
  <> case verse < 1 {
    True -> ""
    False -> do_phrase(phrase, verse - 1)
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
  <> do_phrase("This is the ", end_verse)
}
