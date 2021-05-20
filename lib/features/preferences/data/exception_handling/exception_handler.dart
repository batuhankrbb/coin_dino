import 'package:coin_dino/core/error_handling/custom_failure.dart';
import 'package:coin_dino/features/preferences/data/exception_handling/exceptions/preferences_exceptions.dart';

class PreferencesExceptionHandler {
  CustomFailure handleException(PreferencesException exception) {
    return exception.when(test: () {
      return CustomFailure(message: "test");
    });
  }
}
