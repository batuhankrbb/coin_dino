import 'package:coin_dino/core/error_handling/custom_failure.dart';
import 'package:coin_dino/features/alert/data/exception_handling/exceptions/alert_exceptions.dart';

class AlertExceptionHandler {
  CustomFailure handleException(AlertException exception) {
    return exception.when(test: () {
      return CustomFailure(message: "There is an error in Test");
    });
  }
}
