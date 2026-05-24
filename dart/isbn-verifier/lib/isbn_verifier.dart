bool isValid(String isbn) {
  List<String> characters = isbn.replaceAll("-", "").split("");
  if (characters.length != 10) return false;

  if (characters[9] == 'X') characters[9] = '10';
  final List<int?> digits = characters.map(int.tryParse).toList();
  if (digits.indexOf(null) >= 0) return false;

  final add_digit = (int sum, int i) => sum + digits[i]! * (10 - i);
  return Iterable<int>.generate(10).fold(0, add_digit) % 11 == 0;
}
