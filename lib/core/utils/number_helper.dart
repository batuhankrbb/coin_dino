class NumberHelper {
  static NumberHelper shared = NumberHelper();

  String fixNum(num number, int digitNumber) {
    return number.toStringAsFixed(digitNumber);
  }
}
