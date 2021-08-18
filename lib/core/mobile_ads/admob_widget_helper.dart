import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobWidgetHelper {
  static var shared = AdmobWidgetHelper._privateConstructor();

  AdmobWidgetHelper._privateConstructor();

  Widget buildBannerAdWidget(BannerAd bannerAd) {
    return Container(
      alignment: Alignment.center,
      width: bannerAd.size.width.toDouble(),
      height: bannerAd.size.height.toDouble(),
      child: AdWidget(
        ad: bannerAd,
      ),
    );
  }
}
