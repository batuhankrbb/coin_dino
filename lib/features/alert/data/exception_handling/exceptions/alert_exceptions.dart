import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert_exceptions.freezed.dart';

@freezed
class AlertException with _$AlertException {
  @Implements(Exception)
  const factory AlertException.allAlertsFetchingException() = AllAlertsFetchingException;
  @Implements(Exception)
  const factory AlertException.alertSavingException() = AlertSavingException;
  @Implements(Exception)
  const factory AlertException.alertUpdatingException() = AlertUpdatingException;
  @Implements(Exception)
  const factory AlertException.alertDeletingException() = AlertDeletingException;
  @Implements(Exception)
  const factory AlertException.alertFetchingRemoteException() = AlertFetchingRemoteException;
}