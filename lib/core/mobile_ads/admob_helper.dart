import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobHelper {
  static var shared = AdmobHelper._privateConstructor();

  AdmobHelper._privateConstructor();

  BannerAd makeBannerAd(
      {required String bannerID,
      AdSize bannerSize = AdSize.banner,
      BannerAdListener? listener,
      AdRequest? request}) {
    return BannerAd(
        size: AdSize.banner,
        adUnitId: bannerID,
        listener: listener ?? BannerAdListener(),
        request: request ?? AdRequest());
  }
}
