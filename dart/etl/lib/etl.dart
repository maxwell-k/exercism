class Etl {
  Map<String, int> transform(Map<String, List<String>> legacy) {
    Map<String, int> scores = {};
    legacy.forEach(
      (score, letters) => letters.forEach(
        (letter) => scores[letter.toLowerCase()] = int.parse(score),
      ),
    );
    return scores;
  }
}
