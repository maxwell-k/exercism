class Bob {
  String response(String input) {
    final message = Message(input);

    if (message.isAYell && message.isAQuestion) {
      return "Calm down, I know what I'm doing!";
    } else if (message.isAYell) {
      return "Whoa, chill out!";
    } else if (message.isAQuestion) {
      return "Sure.";
    } else if (message.isSilence) {
      return "Fine. Be that way!";
    }

    return "Whatever.";
  }
}

extension type Message._(String message) {
  Message(String input) : message = input.trim();
  bool get isAQuestion => message.endsWith("?");
  bool get isSilence => message.isEmpty;
  bool get isAYell =>
      message != message.toLowerCase() && message == message.toUpperCase();
}
