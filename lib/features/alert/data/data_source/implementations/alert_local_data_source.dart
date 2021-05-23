import '../../../../../core/hive/hive_constants.dart';
import '../../../../../core/hive/hive_helper.dart';
import '../../exception_handling/exceptions/alert_exceptions.dart';
import '../../model/alert_model.dart';
import '../contracts/i_alert_local_data_source.dart';

class AlertLocalDataSource implements IAlertLocalDataSource {
  var _hiveHelper = HiveHelper();

  @override
  Future<List<AlertModel>> getAllAlerts() async {
    try {
      var alerts =
          await _hiveHelper.getAll<AlertModel>(HiveConstants.BOX_ALERTS);
      return alerts;
    } catch (e) {
      throw AlertException.allAlertsFetchingException();
    }
  }

  @override
  Future<void> deleteAlert(AlertModel alertModel) async {
    try {
      _hiveHelper.deleteData(HiveConstants.BOX_ALERTS, alertModel.coindID);
    } catch (e) {
      throw AlertException.alertDeletingException();
    }
  }

  @override
  Future<void> saveAlert(AlertModel alertModel) async {
    try {
      _hiveHelper.putData(
          HiveConstants.BOX_ALERTS, alertModel.coindID, alertModel);
    } catch (e) {
      throw AlertException.alertSavingException();
    }
  }

  @override
  Future<void> updateAlert(AlertModel alertModel) async {
    try {
      _hiveHelper.putData(
          HiveConstants.BOX_ALERTS, alertModel.coindID, alertModel);
    } catch (e) {
      throw AlertException.alertUpdatingException();
    }
  }
}
