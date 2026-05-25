class WordCount {
  Map<String, int> countWords(String text) {
    return text
        .toLowerCase()
        .split(RegExp(r'[ ,\n!!&@$%^:.]+'))
        .map((i) => i.startsWith("'") ? i.substring(1) : i)
        .map((i) => i.endsWith("'") ? i.substring(0, i.length - 1) : i)
        .where((i) => i.isNotEmpty)
        .fold(
          Map<String, int>(),
          (result, key) =>
              result..update(key, (value) => ++value, ifAbsent: () => 1),
        );
  }
}
