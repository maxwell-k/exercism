class PascalsTriangle {
  List<List<int>> rows(int number) {
    if (number == 0) return [];
    if (number == 1)
      return [
        [1],
      ];

    List<List<int>> result = rows(number - 1);
    final last = result.last;
    final inner = List<int>.generate(
      last.length - 1,
      (i) => last[i] + last[i + 1],
    );
    result.add([1, ...inner, 1]);
    return result;
  }
}
