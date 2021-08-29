import 'package:coin_dino/core/in_app_purchase/iap_service.dart';
import 'package:flutter/material.dart';
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
    await IAPService.shared.initIAPSubscription();
  }
}
