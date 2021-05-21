import 'package:coin_dino/features/alert/data/model/alert_model.dart';

abstract class IAlertLocalDataSource {
  Future<List<AlertModel>> getAllAlerts();
  Future<List<AlertModel>> saveAlertAlerts();
}
