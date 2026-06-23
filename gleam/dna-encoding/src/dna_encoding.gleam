import gleam/result

pub type Nucleotide {
  Adenine
  Cytosine
  Guanine
  Thymine
}

pub fn encode_nucleotide(nucleotide: Nucleotide) -> Int {
  case nucleotide {
    Adenine -> 0
    Cytosine -> 1
    Guanine -> 2
    Thymine -> 3
  }
}

pub fn decode_nucleotide(nucleotide: Int) -> Result(Nucleotide, Nil) {
  case nucleotide {
    0 -> Ok(Adenine)
    1 -> Ok(Cytosine)
    2 -> Ok(Guanine)
    3 -> Ok(Thymine)
    _ -> Error(Nil)
  }
}

pub fn encode(dna: List(Nucleotide)) -> BitArray {
  case dna {
    [] -> <<>>
    [first, ..rest] -> <<encode_nucleotide(first):2, encode(rest):bits>>
  }
}

pub fn decode(dna: BitArray) -> Result(List(Nucleotide), Nil) {
  do_decode(dna) |> result.all
}

fn do_decode(dna: BitArray) -> List(Result(Nucleotide, Nil)) {
  case dna {
    <<>> -> []
    <<value:2, rest:bits>> -> [decode_nucleotide(value), ..do_decode(rest)]
    _ -> [Error(Nil)]
  }
}
