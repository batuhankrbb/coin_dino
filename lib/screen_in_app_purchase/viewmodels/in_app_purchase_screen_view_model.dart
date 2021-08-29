import 'package:coin_dino/core/in_app_purchase/iap_service.dart';
import 'package:coin_dino/core/user_interface/helpers/alert_helper.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobx/mobx.dart';
part 'in_app_purchase_screen_view_model.g.dart';

class InAppPurchaseScreenViewModel = _InAppPurchaseScreenViewModelBase
    with _$InAppPurchaseScreenViewModel;

abstract class _InAppPurchaseScreenViewModelBase with Store {
  BuildContext? context;

  void setContext(BuildContext context) {
    this.context = context;
  }

  Future<void> initInAppPurchaseScreen() async {
    await IAPService.shared.initIAPSubscription(errorAlertFunction: () {
      showAlert(
          "INAPP_SCREEN.ERROR_ALERT_TITLE", "INAPP_SCREEN.ERROR_ALERT_MESSAGE");
    }, purchaseFunction: () {
      showAlert("INAPP_SCREEN.PURCHASE_ALERT_TITLE", "INAPP_SCREEN.PURCHASE_ALERT_MESSAGE");
    }, restoreFunction: () {
      showAlert("INAPP_SCREEN.RESTORE_ALERT_TITLE", "INAPP_SCREEN.RESTORE_ALERT_MESSAGE");
    });
  }

  void showAlert(String title, String message) {
    AlertHelper.shared.showAlertDialog(
        context: context!, title: title.tr(), message: message.tr());
  }
}
