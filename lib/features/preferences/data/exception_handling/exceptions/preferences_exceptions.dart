import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferences_exceptions.freezed.dart';

@freezed
class PreferencesException with _$PreferencesException {
  @Implements(Exception)
  const factory PreferencesException.test() = Test;
}
