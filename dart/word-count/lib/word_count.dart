class WordCount {
  Map<String, int> _add(Map<String, int> result, String key) {
    result.update(key, (int value) => value + 1, ifAbsent: () => 1);
    return result;
  }

  Map<String, int> countWords(String text) {
    return text
        .toLowerCase()
        .split(RegExp(r'[ ,\n!!&@$%^:.]+'))
        .map((i) => i.startsWith("'") ? i.substring(1) : i)
        .map((i) => i.endsWith("'") ? i.substring(0, i.length - 1) : i)
        .where((i) => i.isNotEmpty)
        .fold(Map<String, int>(), _add);
  }
}
