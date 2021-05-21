import 'package:coin_dino/features/alert/data/data_source/contracts/i_alert_local_data_source.dart';
import 'package:coin_dino/features/alert/data/data_source/contracts/i_alert_remote_data_source.dart';
import 'package:coin_dino/features/alert/data/data_source/implementations/alert_remote_data_source.dart';
import 'package:coin_dino/features/alert/data/exception_handling/exception_handler.dart';
import 'package:coin_dino/features/alert/data/exception_handling/exceptions/alert_exceptions.dart';
import 'package:coin_dino/features/alert/data/model/alert_model.dart';
import 'package:coin_dino/features/alert/domain/entity/alert_entity.dart';
import 'package:coin_dino/core/result_types/result.dart';
import 'package:coin_dino/features/alert/domain/repository_contract/i_alert_repository.dart';

class AlertRepository implements IAlertRepository {
  final IAlertLocalDataSource localDataSource;
  final AlertExceptionHandler exceptionHandler;

  AlertRepository(
      {required this.localDataSource, required this.exceptionHandler});

  @override
  Future<Result<List<AlertEntity>>> getAllAlerts() async {
    try {
      var allAlerts = await localDataSource.getAllAlerts();
      var entityList = allAlerts.map((e) => e.toEntity()).toList();
      return Result.success(entityList);
    } on AlertException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }

  @override
  Future<Result<void>> addAlert(AlertEntity alertEntity) async {
    try {
      var result =
          await localDataSource.saveAlert(AlertModel.fromEntity(alertEntity));
      return Result.success(result);
    } on AlertException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }

  @override
  Future<Result<void>> deleteAlert(String alertID) async {
    try {
      var result = await localDataSource.deleteAlert(alertID);
      return Result.success(result);
    } on AlertException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }

  @override
  Future<Result<void>> updateAlert(AlertEntity alertEntity) async {
    try {
      var result =
          await localDataSource.updateAlert(AlertModel.fromEntity(alertEntity));
      return Result.success(result);
    } on AlertException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }
}
