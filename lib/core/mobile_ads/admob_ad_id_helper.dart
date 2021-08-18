import 'dart:io';

class AdmobIDHelper { //* TEST IDS
  static var shared = AdmobIDHelper._privateConstructor();

  AdmobIDHelper._privateConstructor();

  String get alertDetailScreenBannerID {
    return _returnWithChecking(
        iosID: "ca-app-pub-3940256099942544/2934735716",
        androidID: "ca-app-pub-3940256099942544/6300978111");
  }

  String get coinDetailScreenInterstitialID {
    return _returnWithChecking(iosID: "ca-app-pub-3940256099942544/4411468910", androidID: "ca-app-pub-3940256099942544/1033173712");
  }

  String get homeScreenNativeID {
    return _returnWithChecking(iosID: "ca-app-pub-3940256099942544/3986624511", androidID: "ca-app-pub-3940256099942544/2247696110");
  }

  String get searchScreenNativeID {
    return _returnWithChecking(iosID: "ca-app-pub-3940256099942544/3986624511", androidID: "ca-app-pub-3940256099942544/2247696110");
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
