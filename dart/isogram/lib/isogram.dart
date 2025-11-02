class Isogram {
  bool isIsogram(String word) {
    final List<String> runes = word.toLowerCase().split("")
      ..remove(" ")
      ..remove("-");
    return runes.toSet().length == runes.length;
  }
}
