class InvalidNucleotideException implements Exception {}

class NucleotideCount {
  Map<String, int> count(String strand) {
    Map<String, int> result = {"A": 0, "C": 0, "G": 0, "T": 0};
    strand.split("").forEach((i) {
      int? before = result[i];
      if (before != null) {
        result[i] = before + 1;
      } else {
        throw InvalidNucleotideException();
      }
    });
    return result;
  }
}
