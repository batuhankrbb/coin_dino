import 'package:intl/intl.dart';

class DateHelper {
  static var shared = DateHelper();

  String formatDate(
      {required DateTime dateTime, String formatPattern = "yyy-MM-dd"}) {
    var dateFormat = DateFormat(formatPattern);
    return dateFormat.format(dateTime);
  }
}
