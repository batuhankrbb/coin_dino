import 'package:coin_dino/core/error_handling/custom_failure.dart';
import 'package:coin_dino/features/alert/data/exception_handling/exceptions/alert_exceptions.dart';

class AlertExceptionHandler {
  CustomFailure handleException(AlertException exception) {
    return exception.when(
        allAlertsFetchingException: () {
          return CustomFailure(
              message: "There is an error in AllAlertsFetching");
        },
        alertSavingException: () {
          return CustomFailure(
              message: "There is an error in AlertSaving");
        },
        alertUpdatingException: () {
          return CustomFailure(
              message: "There is an error in AlertUpdating");
        },
        alertDeletingException: () {
          return CustomFailure(
              message: "There is an error in AlertDeleting");
        });
  }
}
