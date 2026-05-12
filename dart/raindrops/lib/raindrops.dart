const words = {3: 'Pling', 5: 'Plang', 7: 'Plong'};

class Raindrops {
  String convert(int number) {
    String result = words.keys
        .where((i) => number % i == 0)
        .map((i) => words[i])
        .join("");
    if (result.isEmpty) result = number.toString();
    return result;
  }
}
