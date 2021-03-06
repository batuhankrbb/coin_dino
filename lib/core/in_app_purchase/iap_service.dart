import 'dart:async';
import 'dart:io';

import 'package:coin_dino/core/hive/hive_constants.dart';
import 'package:coin_dino/core/hive/hive_helper.dart';
import 'package:coin_dino/global/app_settings/app_settings_viewmodel.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:coin_dino/secret_file.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_ios/in_app_purchase_ios.dart';
import 'package:in_app_purchase_ios/store_kit_wrappers.dart';

class IAPService {
  IAPService._privateConstructor();

  static var shared = IAPService._privateConstructor();

  var _productIds = [SecretFile.in_app_purchase_premium_ID].toSet();

  var _inAppPurchaseInstance = InAppPurchase.instance;

  List<ProductDetails> _products = [];

  late StreamSubscription<List<PurchaseDetails>> _subscription;

  late VoidCallback errorAlertFunction;
  late VoidCallback purchaseFunction;
  late VoidCallback restoreFunction;

  Future<void> restorePurchase() async {
    try {
      await _inAppPurchaseInstance.restorePurchases();
    } catch (e) {}
  }

  Future<void> purchasePremium() async {
    if (_products.length > 0) {
      var product = _products[0];
      late PurchaseParam purchaseParam;
      if (Platform.isAndroid) {
        purchaseParam = GooglePlayPurchaseParam(
          productDetails: product,
        );
      } else {
        purchaseParam = PurchaseParam(
          productDetails: product,
        );
      }

      await _inAppPurchaseInstance.buyNonConsumable(
          purchaseParam: purchaseParam);
    }
  }

  Future<void> initIAPSubscription(
      {required VoidCallback errorAlertFunction,
      required VoidCallback purchaseFunction,
      required VoidCallback restoreFunction}) async {
    this.errorAlertFunction = errorAlertFunction;
    this.purchaseFunction = purchaseFunction;
    this.restoreFunction = restoreFunction;
    await _initSubscription();
    await _initStoreInfo();
  }

  Future<void> disposeIAP() async {
    _subscription.cancel();
  }

  Future<bool> getIsPremium() async {
    var isPremium = await HiveHelper.shared.getData<bool>(
            HiveConstants.BOX_PREMIUM, HiveConstants.KEY_IS_PREMUM) ??
        false;
    return isPremium;
  }

  Future<void> _initStoreInfo() async {
    final bool isAvailable = await _inAppPurchaseInstance.isAvailable();
    ProductDetailsResponse productDetailResponse =
        await _inAppPurchaseInstance.queryProductDetails(_productIds);
    _products = productDetailResponse.productDetails;
    if (productDetailResponse.error != null ||
        productDetailResponse.productDetails.isEmpty ||
        !isAvailable) {
      return;
    }
  }

  Future<void> _initSubscription() async {
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        _inAppPurchaseInstance.purchaseStream;
    _subscription = purchaseUpdated.listen((purchaseDetailList) {
      if (purchaseDetailList.length > 0) {
        _handlePurchase(purchaseDetailList[0]);
      }
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
      errorAlertFunction();
    });
  }

  Future<void> _handlePurchase(PurchaseDetails purchaseItem) async {
    if (purchaseItem.status == PurchaseStatus.error) {
      errorAlertFunction();
      await _inAppPurchaseInstance.completePurchase(purchaseItem);
    } else if (purchaseItem.status == PurchaseStatus.purchased ||
        purchaseItem.status == PurchaseStatus.restored) {
     await  _deliverProduct(purchaseItem);
      if (purchaseItem.status == PurchaseStatus.purchased) {
        purchaseFunction();
      } else {
        restoreFunction();
      }
    }

    if (purchaseItem.pendingCompletePurchase) {
      await _inAppPurchaseInstance.completePurchase(purchaseItem);
    }
  }

  Future<void> _deliverProduct(PurchaseDetails purchaseDetails) async {
    await HiveHelper.shared.putData<bool>(
        HiveConstants.BOX_PREMIUM, HiveConstants.KEY_IS_PREMUM, true);
    var appSettings = getit.get<AppSettingsViewModel>();
    appSettings.isPremium = true;
  }
}

void initializeIAPService() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      InAppPurchaseAndroidPlatformAddition.enablePendingPurchases();
    }
  }