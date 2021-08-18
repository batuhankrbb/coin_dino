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
    await InterstitialAd.load(
      adUnitId: interstitialID,
      request: adRequest ?? AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
        ad.fullScreenContentCallback = FullScreenContentCallback(
          onAdShowedFullScreenContent: (ad) {
            if (onAdShowed != null) {
              onAdShowed(ad);
            }
          },
          onAdDismissedFullScreenContent: (ad) {
            if (onAdDismissed != null) {
              onAdDismissed(ad);
            }
          },
        );
        ad.show();
      }, onAdFailedToLoad: (error) {
        onAdFailed(error);
      }),
    );
  }
}
