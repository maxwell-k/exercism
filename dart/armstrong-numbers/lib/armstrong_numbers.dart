class ArmstrongNumbers {
  bool isArmstrongNumber(String digits) {
    int length = digits.length;
    BigInt sum = digits
        .split("")
        .map(BigInt.parse)
        .fold(BigInt.zero, (sum, i) => sum + i.pow(length));
    return BigInt.parse(digits) == sum;
  }
}
