import 'dart:ffi';

import '../../../../core/notification/notification_helper.dart';
import '../../../../core/result_types/result.dart';
import '../../domain/entity/alert_entity.dart';
import '../../domain/repository_contract/i_alert_repository.dart';
import '../data_source/contracts/i_alert_local_data_source.dart';
import '../data_source/contracts/i_alert_remote_data_source.dart';
import '../exception_handling/exception_handler.dart';
import '../exception_handling/exceptions/alert_exceptions.dart';
import '../model/alert_coin_model.dart';
import '../model/alert_model.dart';

class AlertRepository implements IAlertRepository {
  final IAlertLocalDataSource localDataSource;
  final IAlertRemoteDataSource remoteDataSource;
  final AlertExceptionHandler exceptionHandler;

  AlertRepository(
      {required this.localDataSource,
      required this.exceptionHandler,
      required this.remoteDataSource});

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
  Future<Result<void>> deleteAlert(AlertEntity alertEntity) async {
    try {
      var result =
          await localDataSource.deleteAlert(AlertModel.fromEntity(alertEntity));
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

  @override
  Future<Result<void>> checkAlerts() async {
    try {
      var allAlerts = await localDataSource.getAllAlerts();
      var alertsIds = allAlerts.map((e) => e.coindID).toList();
      var remoteAlerts = await remoteDataSource.getGivenCoins(
          coinIds: alertsIds,
          vsCurrency: "usd"); //TODO VSCURRENCY PREFERENCESDAN ALINACAK

      List<AlertCoinModel> alertsToNotify = [];

      for (int i = 0; i < allAlerts.length; i++) {
        var localAlert = allAlerts[i];
        var remoteAlert = remoteAlerts[i];
        var isTargetHigh = localAlert.targetPrice > localAlert.price;

        if (isTargetHigh && remoteAlert.currentPrice > localAlert.targetPrice) {
          alertsToNotify.add(remoteAlert);
        } else if (!isTargetHigh &&
            remoteAlert.currentPrice < localAlert.targetPrice) {
          alertsToNotify.add(remoteAlert);
        }
      }

      alertsToNotify.forEach((element) {  //TODO AlertsToNotify içindeki coinleri notification olarak gönder --SERCAN
        NotificationHelper.shared.showNotification( 
            title: element.name,
            description: "price: ${element.currentPrice} and id: ${element.id}",
            payLoad: "deneme");
      });
     
      return Result.success(Void);
    } on AlertException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }
}
