import 'package:easy_localization/easy_localization.dart';

class NumberHelper {
  static final shared = NumberHelper._privateConstructor();

  NumberHelper._privateConstructor();

  String fixNum(num number, int digitNumber) {
    return number.toStringAsFixed(digitNumber);
  }

  String giveFormattedTextByPercentage(num percentage) {
    var percentagePrefix = percentage < 0 ? "" : "+";
    return percentagePrefix + NumberHelper.shared.fixNum(percentage, 2);
  }

  String toCommaString({required num number, int digitNumber = 4, bool withDollarSymbol = false}) {
    RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    var mathFunc = (Match match) => '${match[1]},';

    //number: 2145.1234124
    var truncatedNumber = number.truncate(); // 2145
    var fraction = number - truncatedNumber; //.1234124
    var fractionText = fraction
        .toStringAsFixed(fraction == 0 ? 2 : digitNumber)
        .substring(1); // .1234

    var numberWithCommas =
        truncatedNumber.toString().replaceAllMapped(reg, mathFunc); //2,145

    var finalText = numberWithCommas + fractionText; //2,145.1234124

    if (finalText[0] == "0" && finalText[1] == "0") {
      return withDollarSymbol ? "\$${finalText.substring(1)}": finalText.substring(1);
    } else {
      return withDollarSymbol ? "\$${finalText}" : finalText;
    }
  }

  String toPercentageText(num? number) {
    var newNumber = number ?? 0;
    return "${newNumber.toStringAsFixed(2)}%";
  }
}
