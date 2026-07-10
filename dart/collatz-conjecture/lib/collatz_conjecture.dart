class CollatzConjecture {
  int steps(int n) {
    if (n < 1) throw ArgumentError('Only positive integers are allowed');
    int result;
    for (result = 0; n != 1; result++) {
      n = n % 2 == 0 ? n ~/ 2 : 3 * n + 1;
    }
    return result;
  }
}
