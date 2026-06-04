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
  int value(List<String> input) =>
      colours.indexOf(input[0]) * 10 + colours.indexOf(input[1]);
}
