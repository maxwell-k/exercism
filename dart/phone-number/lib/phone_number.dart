class PhoneNumber {
  String? clean(String input) {
    String result = input.replaceAll(RegExp(r'[() -.]+'), '');
    if (RegExp(r'[@:!]').hasMatch(result))
      throw FormatException('punctuations not permitted');
    if (RegExp(r'[a-zA-Z]').hasMatch(result))
      throw FormatException('letters not permitted');
    if (result.length > 11)
      throw FormatException('must not be greater than 11 digits');
    if (result.length == 11) {
      if (result.startsWith("1")) {
        result = result.substring(1);
      } else {
        throw FormatException('11 digits must start with 1');
      }
    }
    if (result.length < 10)
      throw FormatException('must not be fewer than 10 digits');
    if (result.startsWith("0"))
      throw FormatException('area code cannot start with zero');
    if (result.startsWith("1"))
      throw FormatException('area code cannot start with one');
    if (result.substring(3).startsWith("0"))
      throw FormatException('exchange code cannot start with zero');
    if (result.substring(3).startsWith("1"))
      throw FormatException('exchange code cannot start with one');
    return result;
  }
}
