class Node<T extends Comparable<T>> {
  final T data;
  Node<T>? left, right;

  Node(this.data);

  void insert(T value) {
    bool _left = value.compareTo(data) <= 0;
    if (_left && left == null)
      left = Node<T>(value);
    else if (!_left && right == null)
      right = Node<T>(value);
    else
      (_left ? left : right)!.insert(value);
  }

  Iterable<T> get sortedData sync* {
    for (var t in left?.sortedData ?? <T>[]) yield t;
    yield data;
    for (var t in right?.sortedData ?? <T>[]) yield t;
  }
}

class BinarySearchTree {
  Node<String> root;

  BinarySearchTree(String data) : root = Node<String>(data);

  void insert(String data) => root.insert(data);

  Iterable<Comparable> get sortedData => this.root.sortedData;
}
