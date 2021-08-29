import 'dart:async';
import 'dart:io';

import 'package:coin_dino/secret_file.dart';
import 'package:flutter/foundation.dart';
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

  void initializeIAPService() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      InAppPurchaseAndroidPlatformAddition.enablePendingPurchases();
    }
  }

  Future<void> restorePurchase() async {
    await _inAppPurchaseInstance.restorePurchases();
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

  Future<void> initIAP() async {
    await _initSubscription();
    await _initStoreInfo();
  }

  Future<void> disposeIAP() async {
    _subscription.cancel();
  }

  Future<void> _initStoreInfo() async {
    //? DONE
    final bool isAvailable = await _inAppPurchaseInstance.isAvailable();
    ProductDetailsResponse productDetailResponse =
        await _inAppPurchaseInstance.queryProductDetails(_productIds);
    _products = productDetailResponse.productDetails;
    if (productDetailResponse.error != null ||
        productDetailResponse.productDetails.isEmpty ||
        !isAvailable) {
      //TODO SHOW STATERESULT ERROR
      return;
    }
  }

  Future<void> _initSubscription() async {
    //? DONE
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        _inAppPurchaseInstance.purchaseStream;
    _subscription = purchaseUpdated.listen((purchaseDetailList) {
      if (purchaseDetailList.length > 0) {
        _handlePurchase(purchaseDetailList[0]);
      }
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
      //TODO SHOW STATERESULT ERROR
    });
  }

  Future<void> _handlePurchase(PurchaseDetails purchaseItem) async {
    if (purchaseItem.status == PurchaseStatus.error) {
      //TODO SHOW STATERESULT ERROR
    } else if (purchaseItem.status == PurchaseStatus.purchased ||
        purchaseItem.status == PurchaseStatus.restored) {
      deliverProduct(purchaseItem);

      if (purchaseItem.pendingCompletePurchase) {
        await _inAppPurchaseInstance.completePurchase(purchaseItem);
      }
    }
  }

  void deliverProduct(PurchaseDetails purchaseDetails) async {
    //! Make it premium
  }
}
