class PhoneNumber {
  String clean(String input) {
    final cleaned = input.replaceAll(RegExp(r'[() -.]+'), '');
    if (RegExp(r'[@:!]').hasMatch(cleaned))
      throw FormatException('punctuations not permitted');
    if (RegExp(r'[a-zA-Z]').hasMatch(cleaned))
      throw FormatException('letters not permitted');
    if (cleaned.length > 11)
      throw FormatException('must not be greater than 11 digits');
    if (cleaned.length == 11 && cleaned[0] != "1")
      throw FormatException('11 digits must start with 1');
    if (cleaned.length < 10)
      throw FormatException('must not be fewer than 10 digits');

    final result = cleaned.length == 10 ? cleaned : cleaned.substring(1);
    if (result[0] == "0")
      throw FormatException('area code cannot start with zero');
    if (result[0] == "1")
      throw FormatException('area code cannot start with one');
    if (result[3] == "0")
      throw FormatException('exchange code cannot start with zero');
    if (result[3] == "1")
      throw FormatException('exchange code cannot start with one');
    return result;
  }
}
