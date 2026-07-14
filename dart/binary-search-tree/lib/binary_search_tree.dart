class Node<T extends Comparable<T>> {
  final T data;
  Node<T>? left, right;

  Node(this.data);

  void insert(T value) {
    if (value.compareTo(data) <= 0) {
      left == null ? left = Node<T>(value) : left!.insert(value);
    } else {
      right == null ? right = Node<T>(value) : right!.insert(value);
    }
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
