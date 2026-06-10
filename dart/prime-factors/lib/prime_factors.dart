class PrimeFactors {
  List<int> factors(int value) {
    List<int> result = [];
    for (var i = 2; i <= value; i++) {
      for (; value % i == 0; value ~/= i) result.add(i);
    }
    return result;
  }
}
