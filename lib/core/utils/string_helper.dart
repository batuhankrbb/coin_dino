class StringHelper {
  static final shared = StringHelper._privateConstructor();

  StringHelper._privateConstructor();

  String convertListToCommaString(List<String> texts) {
    if (texts.isEmpty) {
      return "";
    }
    var totalString = "";
    texts.forEach((element) {
      totalString += ",$element";
    });
    return totalString.substring(1);
  }
}
