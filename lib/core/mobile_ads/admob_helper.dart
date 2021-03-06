import 'package:coin_dino/core/in_app_purchase/iap_service.dart';
import 'package:get_it/get_it.dart';
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

  Future<void> showInterstitialAd(
      {required String interstitialID,
      AdRequest? adRequest,
      required Function(LoadAdError error) onAdFailed,
      Function(InterstitialAd ad)? onAdDismissed,
      Function(InterstitialAd ad)? onAdShowed}) async {
    var premium = await IAPService.shared.getIsPremium();
    if (premium) {
      print("premiuma takıldı");
      return;
    }
    print("premiuma takılmadı");
    await InterstitialAd.load(
      adUnitId: interstitialID,
      request: adRequest ?? AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
        ad.fullScreenContentCallback =
            FullScreenContentCallback(onAdShowedFullScreenContent: (ad) {
          if (onAdShowed != null) {
            onAdShowed(ad);
          }
        }, onAdDismissedFullScreenContent: (ad) {
          if (onAdDismissed != null) {
            onAdDismissed(ad);
            ad.dispose();
          }
        }, onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
        });
        ad.show();
      }, onAdFailedToLoad: (error) {
        onAdFailed(error);
      }),
    );
  }
}
