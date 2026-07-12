class SecretHandshake {
  static const _events = <String>[
    'wink',
    'double blink',
    'close your eyes',
    'jump',
  ];

  List<String> commands(int message) {
    final output = <String>[];
    for (int i = 0; i < _events.length; i++)
      if (message >> i & 1 == 1) output.add(_events[i]);
    return (message >> _events.length & 1 == 1)
        ? output.reversed.toList()
        : output;
  }
}
