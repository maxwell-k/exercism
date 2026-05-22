class ArmstrongNumbers {
  bool isArmstrongNumber(String digits) {
    BigInt sum = BigInt.from(0);
    for (int i = 0; i < digits.length; i++) {
      sum += BigInt.parse(digits[i]).pow(digits.length);
    }
    return BigInt.parse(digits) == sum;
  }
}
