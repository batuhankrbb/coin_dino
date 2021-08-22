import '../../model/alert_model.dart';

abstract class IAlertLocalDataSource {
  Future<List<AlertModel>> getAllSavedAlerts();
  Future<void> saveAlert(AlertModel alertModel);
  Future<void> updateAlert(AlertModel alertModel);
  Future<void> deleteAlert(AlertModel alertModel);
}
