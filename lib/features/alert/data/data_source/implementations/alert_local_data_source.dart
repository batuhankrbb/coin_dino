import 'package:coin_dino/features/alert/data/data_source/contracts/i_alert_local_data_source.dart';
import 'package:coin_dino/features/alert/data/model/alert_model.dart';

class AlertLocalDataSource implements IAlertLocalDataSource{
  @override
  Future<List<AlertModel>> getAllAlerts() {
    // TODO: implement getAllAlerts
    throw UnimplementedError();
  }

  @override
  Future<List<AlertModel>> saveAlertAlerts() {
    // TODO: implement saveAlertAlerts
    throw UnimplementedError();
  }
  
}