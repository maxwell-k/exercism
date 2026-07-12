class Offset {
  final int x, y;
  const Offset(this.x, this.y);
}

const List<Offset> offsets = [
  Offset(-1, -1),
  Offset(-1, 0),
  Offset(-1, 1),
  Offset(0, -1),
  Offset(0, 1),
  Offset(1, 1),
  Offset(1, 0),
  Offset(1, -1),
];

class FlowerField {
  List<String> input;
  FlowerField(this.input);

  bool flower(String input) => input == '*';

  int get rows => this.input.length;
  int get columns => this.rows > 0 ? input[0].length : 0;

  List<String> get annotated {
    final output = List<String>.filled(this.rows, "");
    for (int y = 0; y < rows; y++)
      for (int x = 0; x < columns; x++) output[y] += value(x, y);
    return output;
  }

  String value(int x, int y) {
    if (flower(this.input[y][x])) return this.input[y][x];
    final flowers = offsets
        .where((o) => x + o.x >= 0)
        .where((o) => x + o.x < columns)
        .where((o) => y + o.y >= 0)
        .where((o) => y + o.y < rows)
        .where((o) => flower(this.input[y + o.y][x + o.x]))
        .length;
    return flowers > 0 ? flowers.toString() : this.input[y][x];
  }
}
