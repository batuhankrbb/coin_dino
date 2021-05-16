class NumberHelper {
   static NumberHelper shared = NumberHelper();

  String fixDouble(double number, int digitNumber) {
    return number.toStringAsFixed(digitNumber);
  }
}
