import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert_exceptions.freezed.dart';

@freezed
class AlertException with _$AlertException {
  @Implements(Exception)
  const factory AlertException.test() = Test;
}
