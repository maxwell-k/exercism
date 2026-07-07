class DifferenceOfSquares {
  Iterable<int> _series(int n) => Iterable<int>.generate(n, (i) => i + 1);

  num squareOfSum(int n) {
    final int sum = _series(n).fold(0, (prev, element) => prev + element);
    return sum * sum;
  }

  num sumOfSquares(int n) =>
      _series(n).fold(0, (prev, element) => prev + element * element);

  num differenceOfSquares(int n) => squareOfSum(n) - sumOfSquares(n);
}
