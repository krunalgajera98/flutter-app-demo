import 'dart:developer';

import 'package:demo_flutter/Screen/AdConstant/app_id/ad_constant.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


class NativeAds extends StatefulWidget {
  const NativeAds({Key? key}) : super(key: key);

  @override
  State<NativeAds> createState() => _NativeAdsState();
}

class _NativeAdsState extends State<NativeAds> {
  late NativeAd _googleNativeBannerAd;
  late FacebookNativeAd facebookNativeAd;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    loadNativeAd();
  }

  void loadNativeAd() {
    /// Load Google ads only when Facebook ads are turned off
    if (AdConstants.isShowFacebookNativeBannerAds != true && AdConstants.isShowAds) {
      _googleNativeBannerAd = NativeAd(
        request: const AdRequest(),
        adUnitId: AdConstants.nativeBannerAdUnitId,
        factoryId: 'NativeAd',
        listener: NativeAdListener(onAdLoaded: (ad) {
          setState(() {
            isLoaded = true;
            // isLoaded = AdConstants.isShowNativeAds;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
          log('loadNativeAd: onAdFailedToLoad ===> ${error.message} && ${error.code}');
        }),
      );
      _googleNativeBannerAd.load();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (AdConstants.isShowAds) {
      if (isLoaded) {
        /// facebook native banner ad
        return AdConstants.isShowFacebookNativeBannerAds
            ? _nativeAd()

            /// google native banner ad
            : Container(
                alignment: Alignment.center,
                height: 90,
                color: Colors.transparent,
                child: AdWidget(
                  ad: _googleNativeBannerAd,
                ),
                // color: Colors.black12,
              );
      } else {
        return const SizedBox();
      }
    } else {
      return const SizedBox();
    }
  }
}

/// facebook native banner ad
Widget _nativeBannerAd() {
  return FacebookNativeAd(
    placementId: AdConstants.facebookNativeBannerAdUnitId,
    adType: NativeAdType.NATIVE_BANNER_AD,
    bannerAdSize: NativeBannerAdSize.HEIGHT_100,
    width: double.infinity,
    backgroundColor: Colors.blue,
    titleColor: Colors.white,
    descriptionColor: Colors.white,
    buttonColor: Colors.deepPurple,
    buttonTitleColor: Colors.white,
    buttonBorderColor: Colors.white,
    listener: (result, value) {
      switch (result) {
        case NativeAdResult.ERROR:
          log("Facebook Banner Ad Error: $value");
          break;
        case NativeAdResult.LOADED:
          log("Facebook Banner Ad Loaded: $value");
          break;
        case NativeAdResult.CLICKED:
          log("Facebook Banner Ad Clicked: $value");
          break;
        case NativeAdResult.LOGGING_IMPRESSION:
          log("Facebook Banner Ad Logging Impression: $value");
          break;
        case NativeAdResult.MEDIA_DOWNLOADED:
          break;
      }
    },
  );
}

/// facebook native ad
Widget _nativeAd() {
  return FacebookNativeAd(
    placementId: AdConstants.facebookNativeAdUnitId,
    adType: NativeAdType.NATIVE_AD_VERTICAL,
    width: double.infinity,
    height: 300,
    backgroundColor: Colors.blue,
    titleColor: Colors.white,
    descriptionColor: Colors.white,
    buttonColor: Colors.deepPurple,
    buttonTitleColor: Colors.white,
    buttonBorderColor: Colors.white,
    listener: (result, value) {
      switch (result) {
        case NativeAdResult.ERROR:
          log("Facebook Banner Ad Error: $value");
          break;
        case NativeAdResult.LOADED:
          log("Facebook Banner Ad Loaded: $value");
          break;
        case NativeAdResult.CLICKED:
          log("Facebook Banner Ad Clicked: $value");
          break;
        case NativeAdResult.LOGGING_IMPRESSION:
          log("Facebook Banner Ad Logging Impression: $value");
          break;
        case NativeAdResult.MEDIA_DOWNLOADED:
          break;
      }
    },
    keepExpandedWhileLoading: true,
    expandAnimationDuraion: 1000,
  );
}

