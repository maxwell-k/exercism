class Etl {
  Map<String, int> transform(Map<String, List<String>> legacy) => {
    for (MapEntry entry in legacy.entries)
      for (String letter in entry.value)
        letter.toLowerCase(): int.parse(entry.key),
  };
}
