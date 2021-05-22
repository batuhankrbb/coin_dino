import 'package:coin_dino/core/hive/hive_constants.dart';
import 'package:coin_dino/core/hive/hive_helper.dart';
import 'package:coin_dino/features/alert/data/data_source/contracts/i_alert_local_data_source.dart';
import 'package:coin_dino/features/alert/data/exception_handling/exceptions/alert_exceptions.dart';
import 'package:coin_dino/features/alert/data/model/alert_model.dart';

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
  Future<void> deleteAlert(String alertID) async{
    try {
      //TODO İMPLEMENT EDİLECEK
    } catch (e) {
      throw AlertException.alertDeletingException();
    }
  }

  @override
  Future<void> saveAlert(AlertModel alertModel) async {
    try {
      //TODO İMPLEMENT EDİLECEK
    } catch (e) {
      throw AlertException.alertSavingException();
    }
  }

  @override
  Future<void> updateAlert(AlertModel alertModel) async {
    try {
      //TODO İMPLEMENT EDİLECEK
    } catch (e) {
      throw AlertException.alertUpdatingException();
    }
  }
}
