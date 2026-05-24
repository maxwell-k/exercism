class EggCounter {
  int count(int number) {
    return number == 0 ? 0 : number % 2 + count(number ~/ 2);
  }
}
