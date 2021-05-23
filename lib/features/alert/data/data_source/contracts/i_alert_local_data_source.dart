import 'package:coin_dino/features/alert/data/model/alert_model.dart';

abstract class IAlertLocalDataSource {
  Future<List<AlertModel>> getAllAlerts();
  Future<void> saveAlert(AlertModel alertModel);
  Future<void> updateAlert(AlertModel alertModel);
  Future<void> deleteAlert(AlertModel alertModel);
}
