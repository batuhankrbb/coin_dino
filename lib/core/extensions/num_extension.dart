import 'package:intl/intl.dart';

extension DateNum on num {
  DateTime toDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(this.toInt());
  }
}
