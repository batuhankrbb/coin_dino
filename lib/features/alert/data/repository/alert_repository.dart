import 'package:coin_dino/features/alert/domain/entity/alert_entity.dart';

import '../../../../core/notification/notification_helper.dart';
import '../../../../core/result_types/result.dart';
import '../../../preferences/data/contracts/i_preferences_local_data_source.dart';
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
  final IPreferencesLocalDataSource preferencesLocalDataSource;

  AlertRepository(
      {required this.localDataSource,
      required this.exceptionHandler,
      required this.remoteDataSource,
      required this.preferencesLocalDataSource});

  @override
  Future<Result<List<AlertEntity>>> getAllAlerts() async {
    try {
      List<AlertModel> allSavedAlerts = await localDataSource
          .getAllSavedAlerts(); // get saved alerts from local database
      List<String> savedIdList = allSavedAlerts.map((e) => e.coindID).toList();
      String baseCurrency = await getBaseCurrency(); // get base currency
      List<AlertCoinModel> allCoinAlerts = await remoteDataSource.getGivenCoins(
          //get coins from api by the help of saved alerts' id
          coinIds: savedIdList,
          vsCurrency: baseCurrency);

      List<AlertEntity> entityList = [];

      for (int i = 0; i < savedIdList.length; i++) {
        //merge coins from api and local saved alerts
        var entity = allCoinAlerts[i].toEntity(allSavedAlerts[i].targetPrice);
        entityList.add(entity);
      }
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

  Future<String> getBaseCurrency() async {
    try {
      var baseCurrency =
          await preferencesLocalDataSource.getBaseCurrencyPreference();
      return baseCurrency;
    } catch (e) {
      return "usd";
    }
  }

  @override
  Future<Result<void>> checkAlertsForNotification() async {
    //TODO WILL BE REORGANIZED
    try {
      var baseCurrency = await getBaseCurrency();
      var allAlerts = await localDataSource.getAllSavedAlerts();
      var alertsIds = allAlerts.map((e) => e.coindID).toList();
      var remoteAlerts = await remoteDataSource.getGivenCoins(
          coinIds: alertsIds, vsCurrency: baseCurrency);

      List<AlertCoinModel> alertsToNotify = [];

      for (int i = 0; i < allAlerts.length; i++) {
        var localAlert = allAlerts[i];
        var remoteAlert = remoteAlerts[i];
        var isTargetHigh = localAlert.targetPrice > remoteAlert.currentPrice;

        if (isTargetHigh && remoteAlert.currentPrice > localAlert.targetPrice) {
          alertsToNotify.add(remoteAlert);
        } else if (!isTargetHigh &&
            remoteAlert.currentPrice < localAlert.targetPrice) {
          alertsToNotify.add(remoteAlert);
        }
      }

      alertsToNotify.forEach((element) {
        NotificationHelper.shared.showNotification(
            title: element.name,
            description: "price: ${element.currentPrice} and id: ${element.id}",
            payLoad: "deneme");
      });

      return Result.success("sadaqsd");
    } on AlertException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }
}
