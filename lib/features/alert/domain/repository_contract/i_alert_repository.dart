import 'package:coin_dino/core/result_types/result.dart';
import 'package:coin_dino/features/alert/domain/entity/alert_entity.dart';

abstract class IAlertRepository{
  Future<Result<List<AlertEntity>>> getAllAlerts();
  Future<Result<void>> addAlert(AlertEntity alertEntity);
  Future<Result<void>> deleteAlert(AlertEntity alertEntity);
  Future<Result<void>> updateAlert(AlertEntity alertEntity);
  Future<Result<void>> checkAlerts();
}