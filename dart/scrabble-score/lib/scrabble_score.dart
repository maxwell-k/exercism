Map<String, int> table = const {
  'A, E, I, O, U, L, N, R, S, T': 1,
  'D, G': 2,
  'B, C, M, P': 3,
  'F, H, V, W, Y': 4,
  'K': 5,
  'J, X': 8,
  'Q, Z': 10,
};

int score(String word) {
  Map<String, int> scores = {};
  table.forEach(
    (letters, score) =>
        letters.split(', ').forEach((letter) => scores[letter] = score),
  );

  return word
      .toUpperCase()
      .split("")
      .fold(0, (acc, i) => acc + (scores[i] ?? 0));
}
