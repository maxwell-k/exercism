import 'dart:math' show pow;

const colours = [
  'black',
  'brown',
  'red',
  'orange',
  'yellow',
  'green',
  'blue',
  'violet',
  'grey',
  'white',
];

class ResistorColorDuo {
  static const int length = 2;
  int value(List<String> input) => List.generate(
    length,
    (int i) => colours.indexOf(input[i]) * pow(10, length - 1 - i) as int,
  ).fold(0, (previous, element) => previous + element);
}
