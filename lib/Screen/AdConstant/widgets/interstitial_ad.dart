import 'dart:async';
import 'dart:developer';

import 'package:demo_flutter/Screen/AdConstant/app_id/ad_constant.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


const int maxFailedLoadAttempts = 3;

class InterstitialAdUtils {
  static InterstitialAd? adMobInterstitialAd;
  static bool isReadyToShowAd = true;
  static bool firstAdShowDelayed = true;
  static bool isFacebookInterstitialAdLoaded = false;
  static int? firstCoolDown = 30;
  static int? secondCoolDown = 40;
  static int _numInterstitialLoadAttempts = 0;
  static const AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  static void loadFacebookAd(String adsType) {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: AdConstants.facebookInterstitialAdUnitId,
      listener: (result, value) {
        switch (result) {
          case InterstitialAdResult.LOADED:
            isFacebookInterstitialAdLoaded = true;
            break;
          case InterstitialAdResult.DISPLAYED:
            break;
          case InterstitialAdResult.DISMISSED:
            isFacebookInterstitialAdLoaded = false;
            loadInterstitialAds();
            break;
          case InterstitialAdResult.CLICKED:
            break;
          case InterstitialAdResult.ERROR:
            isFacebookInterstitialAdLoaded = false;
            if (adsType != "AdMobInterstitialAds") {
              loadAdMobAd("FacebookInterstitialAds");
            }
            break;
          default:
        }
      },
    );
  }

  static void loadAdMobAd(String adsType) {
    InterstitialAd.load(
      adUnitId: AdConstants.interstitialAdUnitId,
      request: request,
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          log('InterstitialAd loaded $ad ');
          adMobInterstitialAd = ad;
          _numInterstitialLoadAttempts = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          log('InterstitialAd onAdFailedToLoad: $error.');
          if (adsType != "FacebookInterstitialAds") {
            loadFacebookAd("AdMobInterstitialAds");
          }
          _numInterstitialLoadAttempts += 1;
          adMobInterstitialAd = null;
          if (_numInterstitialLoadAttempts <= maxFailedLoadAttempts) {
            loadInterstitialAds();
          }
        },
      ),
    );
  }

  static void loadInterstitialAds() {
    log('-----### Load Interstitial Ads ###------');
    if (AdConstants.isShowAds) {
      log('getEnumVal ===> 00: ${AdConstants.isShowAds}');
      if (AdConstants.isShowFacebookInterstitialAds) {
        loadFacebookAd("FacebookInterstitialAds");
      } else {
        loadAdMobAd("AdMobInterstitialAds");
      }
    }

    if (firstAdShowDelayed) {
      Future.delayed(Duration(seconds: firstCoolDown!), () {
        firstAdShowDelayed = false;
      });
    }
  }

  static void showInterstitialAds() {
    if (!firstAdShowDelayed) {
      if (isReadyToShowAd && adMobInterstitialAd != null) {
        adMobInterstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
          onAdShowedFullScreenContent: (InterstitialAd ad) {},
          onAdDismissedFullScreenContent: (InterstitialAd ad) {
            log('showInterstitialAds: onAdDismissedFullScreenContent ===> $ad ');
            ad.dispose();
            loadInterstitialAds();
          },
          onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
            log('showInterstitialAds: onAdFailedToShowFullScreenContent ===>  $ad && $error');
            ad.dispose();
            loadInterstitialAds();
          },
        );
        adMobInterstitialAd!.show();
        adMobInterstitialAd = null;
        isReadyToShowAd = false;
        Future.delayed(
          Duration(seconds: secondCoolDown!),
          () {
            isReadyToShowAd = true;
          },
        );
      } else if (isReadyToShowAd && isFacebookInterstitialAdLoaded) {
        FacebookInterstitialAd.showInterstitialAd();
        isReadyToShowAd = false;
        Future.delayed(
          Duration(seconds: secondCoolDown!),
          () {
            isReadyToShowAd = true;
          },
        );
      }
    }
  }

  static void forceShowInterstitialAds() {
    if (adMobInterstitialAd != null) {
      adMobInterstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (InterstitialAd ad) {},
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          log('showInterstitialAds: onAdDismissedFullScreenContent ===> $ad ');
          ad.dispose();
          loadInterstitialAds();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          log('showInterstitialAds: onAdFailedToShowFullScreenContent ===>  $ad && $error');
          ad.dispose();
          loadInterstitialAds();
        },
      );
      adMobInterstitialAd!.show();
      adMobInterstitialAd = null;
    } else if (isFacebookInterstitialAdLoaded) {
      FacebookInterstitialAd.showInterstitialAd();
    }
  }
}
