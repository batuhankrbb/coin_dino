import 'package:intl/intl.dart';

class DateHelper {
  static final shared = DateHelper._privateConstructor();

  DateHelper._privateConstructor();

  String formatDate(
      {required DateTime dateTime, String formatPattern = "yyy-MM-dd"}) {
    var dateFormat = DateFormat(formatPattern);
    return dateFormat.format(dateTime);
  }
}
