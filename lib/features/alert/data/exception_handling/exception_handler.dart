import '../../../../core/error_handling/custom_failure.dart';
import 'exceptions/alert_exceptions.dart';

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
        },alertFetchingRemoteException: () {
          return CustomFailure(
              message: "There is an error in AlertFetchingRemoteException");
        });
  }
}
