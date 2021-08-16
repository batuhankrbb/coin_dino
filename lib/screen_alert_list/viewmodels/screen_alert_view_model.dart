import 'package:coin_dino/features/alert/domain/entity/alert_entity.dart';

import '../../core/result_types/state_result.dart';
import '../../core/user_interface/helpers/alert_helper.dart';
import '../../features/alert/data/repository/alert_repository.dart';

import '../../features/alert/domain/repository_contract/i_alert_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'screen_alert_view_model.g.dart';

class ScreenAlertViewModel = _ScreenAlertViewModelBase
    with _$ScreenAlertViewModel;

abstract class _ScreenAlertViewModelBase with Store {
  final IAlertRepository alertRepository;
  _ScreenAlertViewModelBase({required this.alertRepository});

  BuildContext? context;

  void setContext(BuildContext context) {
    this.context = context;
  }

  @observable
  StateResult<List<AlertEntity>> alertResult = StateResult.initial();

  @action
  Future<void> addAlert(AlertEntity entity, num targetPrice) async {
    var newAlertEntity = AlertEntity(
        coindID: entity.coindID,
        name: entity.name,
        image: entity.image,
        symbol: entity.symbol,
        currentPrice: entity.currentPrice,
        targetPrice: targetPrice);
      
    var result = await alertRepository.addAlert(newAlertEntity);
    result.when(success: (_) {
      AlertHelper.shared
          .showSnackBar("Alert has been added successfully", context!);
    }, failure: (failure) {
      AlertHelper.shared
          .showSnackBar("Something went wrong. Try again.", context!);
    });
  }

  @action
  Future<void> updateAlert(AlertEntity entity, num newTargetPrice) async {
    var result = await alertRepository.updateAlert(entity);
    result.when(success: (_) {
      AlertHelper.shared
          .showSnackBar("Alert has been updated successfully", context!);
    }, failure: (failure) {
      AlertHelper.shared
          .showSnackBar("Something went wrong. Try again.", context!);
    });
  }

  @action
  Future<void> getAllAlerts() async {
    //DONE
    alertResult = StateResult.loading();
    var result = await alertRepository.getAllAlerts();
    result.when(success: (alerts) {
      if (alerts.isEmpty) {
        alertResult = StateResult.initial();
      } else {
        alertResult = StateResult.completed(alerts);
      }
    }, failure: (failure) {
      alertResult = StateResult.failed(failure);
    });
  }

  @action
  Future<void> deleteAlert(AlertEntity entity) async {
    //DONE
    var result = await alertRepository.deleteAlert(entity);
    result.when(success: (_) {
      AlertHelper.shared.showSnackBar("deleted succesfully", context!);
    }, failure: (failure) {
      AlertHelper.shared
          .showSnackBar("deleting failed ${failure.message}", context!);
    });
  }
}

/*
  Future<Result<List<AlertEntity>>> getAllAlerts();
  Future<Result<void>> addAlert(AlertEntity alertEntity);
  Future<Result<void>> deleteAlert(AlertEntity alertEntity);
  Future<Result<void>> updateAlert(AlertEntity alertEntity);
  Future<Result<void>> checkAlerts();
*/