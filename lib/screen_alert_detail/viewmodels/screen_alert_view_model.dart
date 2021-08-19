import 'package:coin_dino/core/navigation/services/navigation_service.dart';
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
  StateResult<List<AlertEntity>> alertResult = StateResult.loading();

  @observable
  ObservableList<AlertEntity> alertListToShow = ObservableList();

  @observable
  TextEditingController textEditingController = TextEditingController();

  @action
  Future<void> addAlert({required AlertEntity entity}) async {
    executeWithCheckingTargetPrice((targetPrice) async {
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
    });
  }

  @action
  Future<void> updateAlert({required AlertEntity entity}) async {
    executeWithCheckingTargetPrice((targetPrice) async {
      var updatedEntity = AlertEntity.copyWithTargetPrice(entity, targetPrice);
      var result = await alertRepository.updateAlert(updatedEntity);
      result.when(success: (_) {
        AlertHelper.shared
            .showSnackBar("Alert has been updated successfully", context!);
        getAllAlerts();
      }, failure: (failure) {
        AlertHelper.shared
            .showSnackBar("Something went wrong. Try again.", context!);
      });
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
    if (alertListToShow.isEmpty) {
      alertResult = StateResult.initial();
    }

    result.when(success: (_) {
      AlertHelper.shared.showSnackBar("deleted succesfully", context!);
    }, failure: (failure) {
      AlertHelper.shared.showSnackBar("deleting failed", context!);
    });
  }

  Future<void> executeWithCheckingTargetPrice(
      Function(num targetPrice) func) async {
    print(textEditingController.text);
    var newTargetPrice = num.tryParse(textEditingController.text);
    if (newTargetPrice == null) {
      AlertHelper.shared
          .showSnackBar("You should enter a valid number.", context!, false);
    } else {
      await func(newTargetPrice);
      NavigationService.shared.goBack();
    }
  }
}
