import 'dart:developer';

import 'package:demo_flutter/Screen/AdConstant/app_id/ad_constant.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AppOpenAdUtils {
  static AppOpenAd? _appOpenAd;
  static bool isShowingAd = false;

  /// Whether an ad is available to be shown.
  static bool get isAdLoaded {
    return _appOpenAd != null;
  }

  /// Show AppOpenAd if Available.
  static void showOpenAppAdIfAvailable() {
    if (AdConstants.isShowAds) {
      if (isAdLoaded == false) {
        loadAd(id: AdConstants.appOpenAdUnitId);
        return;
      } else {
        _appOpenAd!.show();
      }
      if (isShowingAd) {
        return;
      }
      // Set the fullScreenContentCallback and show the ad.
      _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (ad) {
          isShowingAd = true;
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          isShowingAd = false;
          ad.dispose();
          _appOpenAd = null;
        },
        onAdDismissedFullScreenContent: (ad) {
          isShowingAd = false;
          ad.dispose();
          _appOpenAd = null;
          loadAd(id: AdConstants.appOpenAdUnitId);
        },
      );
    }
  }

  /// Load an AppOpenAd.
  static Future<void> loadAd({required String id}) async {
    try {
      await AppOpenAd.load(
        adUnitId: id,
        orientation: AppOpenAd.orientationPortrait,
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {
            _appOpenAd = ad;
          },
          onAdFailedToLoad: (error) {
            log('showOpenAppAdIfAvailable: onAdFailedToLoad $error');
          },
        ),
      );
    } catch (e, st) {
      log('AppOpenAdUtils loadAd e: $e && st: $st');
    }
  }
}
