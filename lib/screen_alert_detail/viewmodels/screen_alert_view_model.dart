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

  @observable
  ObservableList<AlertEntity> alertListToShow = ObservableList();

  @action
  Future<void> addAlert({required AlertEntity entity, num? targetPrice}) async {
    var newAlertEntity = AlertEntity.copyWithTargetPrice(entity, targetPrice);

    var result = await alertRepository.addAlert(newAlertEntity);
    result.when(success: (_) {
      getAllAlerts();
      AlertHelper.shared
          .showSnackBar("Alert has been added successfully", context!);
    }, failure: (failure) {
      AlertHelper.shared
          .showSnackBar("Something went wrong. Try again.", context!);
    });
  }

  @action
  Future<void> updateAlert(
      {required AlertEntity entity, num? newTargetPrice}) async {
    var updatedEntity = AlertEntity.copyWithTargetPrice(entity, newTargetPrice);
    var result = await alertRepository.updateAlert(updatedEntity);
    result.when(success: (_) {
      AlertHelper.shared
          .showSnackBar("Alert has been updated successfully", context!);
      getAllAlerts();
    }, failure: (failure) {
      AlertHelper.shared
          .showSnackBar("Something went wrong. Try again.", context!);
    });
  }

  @action
  Future<void> getAllAlerts() async {
    var result = await alertRepository.getAllAlerts();
    alertResult = StateResult.loading();
    result.when(success: (alerts) {
      alertListToShow.clear();
      if (alerts.isEmpty) {
        alertResult = StateResult.initial();
      } else {
        alertResult = StateResult.completed(alerts);
        alertListToShow.addAll(alerts);
      }
    }, failure: (failure) {
      alertResult = StateResult.failed(failure);
    });
  }

  @action
  Future<void> deleteAlert({required AlertEntity entity}) async {
    var index = alertListToShow.indexOf(entity);
    var result = await alertRepository.deleteAlert(entity);
    alertListToShow.removeAt(index);
    result.when(success: (_) {
      AlertHelper.shared.showSnackBar("deleted succesfully", context!);
    }, failure: (failure) {
      AlertHelper.shared.showSnackBar("deleting failed", context!);
    });
  }
}
