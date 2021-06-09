import 'package:intl/intl.dart';

extension DateNum on num {
  DateTime toDateTime() { //TODO DEĞİŞECEK
    return DateTime.fromMillisecondsSinceEpoch(this.toInt());
  }
}
