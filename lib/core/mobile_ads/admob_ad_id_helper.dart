import 'dart:io';

import 'package:coin_dino/secret_file.dart';

class AdmobIDHelper { //* TEST IDS
  static var shared = AdmobIDHelper._privateConstructor();

  AdmobIDHelper._privateConstructor();

  String get alertDetailScreenBannerID {
    return _returnWithChecking(
        iosID: SecretFile.ios_alertDetailScreenBannerID,
        androidID: SecretFile.android_alertDetailScreenBannerID);
  }

  String get coinDetailScreenInterstitialID {
    return _returnWithChecking(iosID: SecretFile.ios_coinDetailScreenInterstitialID, androidID: SecretFile.android_coinDetailScreenInterstitialID);
  }

  String _returnWithChecking(
      {required String iosID, required String androidID}) {
    if (Platform.isIOS || Platform.isMacOS) {
      return iosID;
    } else {
      return androidID;
    }
  }
}
