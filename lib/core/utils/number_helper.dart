class NumberHelper {
  static NumberHelper shared = NumberHelper();

  String fixNum(num number, int digitNumber) {
    return number.toStringAsFixed(digitNumber);
  }

  String giveFormattedTextByPercentage(num percentage) {
    var percentagePrefix = percentage < 0 ? "" :"+";
     return percentagePrefix + NumberHelper.shared.fixNum(percentage, 2);    
  }
}
