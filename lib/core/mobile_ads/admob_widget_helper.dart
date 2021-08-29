import 'package:coin_dino/global/app_settings/app_settings_viewmodel.dart';
import 'package:coin_dino/global/starting_files/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobWidgetHelper {
  static var shared = AdmobWidgetHelper._privateConstructor();

  AdmobWidgetHelper._privateConstructor();

  Widget buildBannerAdWidget(BannerAd bannerAd) {
    
    var appSettingsVM = getit.get<AppSettingsViewModel>();
    if (appSettingsVM.isPremium) {
      return SizedBox();
    } else {
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
}
