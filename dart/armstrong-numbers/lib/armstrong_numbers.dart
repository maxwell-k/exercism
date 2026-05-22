class ArmstrongNumbers {
  bool isArmstrongNumber(String digits) {
    BigInt sum = digits
        .split('')
        .fold(
          BigInt.zero,
          (sum, digit) => sum + BigInt.parse(digit).pow(digits.length),
        );
    return BigInt.parse(digits) == sum;
  }
}
