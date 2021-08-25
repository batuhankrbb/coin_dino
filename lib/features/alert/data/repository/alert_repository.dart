import '../../domain/entity/alert_entity.dart';

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
import 'package:easy_localization/easy_localization.dart';

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
        var entity = allCoinAlerts[i].toEntity(
            allSavedAlerts[i].targetPrice, allSavedAlerts[i].alertForBigNumber);
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
    try {
      var result = await getAllAlerts();
      List<AlertEntity> alertsToNotify = [];

      result.when(success: (data) {
        data.forEach((element) {
          if ((element.alertForBigNumber ?? true) == true &&
              element.currentPrice >= (element.targetPrice ?? 0)) {
            alertsToNotify.add(element);
          } else if ((element.alertForBigNumber ?? true) == false &&
              element.currentPrice < (element.targetPrice ?? 0)) {
            alertsToNotify.add(element);
          }
          _sendNotifications(alertsToNotify);
        });
      }, failure: (failure) {
        throw AlertException.allAlertsFetchingException();
      });

      return Result.success(result);
    } on AlertException catch (e) {
      return Result.failure(exceptionHandler.handleException(e));
    }
  }

  void _sendNotifications(List<AlertEntity> alertsToNotify) {
    if (alertsToNotify.length > 2) {
      NotificationHelper.shared.showNotification(
          title: "NOTIFICATION_MULTIPLE_COINS_ALERT_TITLE".tr(),
          description: "NOTIFICATION_MULTIPLE_COINS_ALERT_DESCRIPTION".tr(),
          payLoad: "payload");
    } else {
      alertsToNotify.forEach(
        (element) {
          NotificationHelper.shared.showNotification(
              title:
                  "NOTIFICATION_COIN_ALERT_TITLE".tr(args: ["${element.name}"]),
              description: "NOTIFICATION_COIN_ALERT_DESCRIPTION".tr(),
              payLoad: "payload");
        },
      );
    }
  }
}
