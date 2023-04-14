import 'dart:developer';

  import 'package:demo_flutter/Screen/AdConstant/app_id/ad_constant.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAds extends StatefulWidget {
  const BannerAds({Key? key}) : super(key: key);

  @override
  _BannerAdsState createState() => _BannerAdsState();
}

class _BannerAdsState extends State<BannerAds> {
  bool isBannerAdLoaded = false;
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    loadBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    return AdConstants.isShowFacebookBannerAds
        ? Container(
            height: 60,
            alignment: const Alignment(0.5, 1),
            child: FacebookBannerAd(
              placementId: '', //"${AdConstants.facebookBannerAdUnitId}",
              bannerSize: BannerSize.STANDARD,
              listener: (result, value) {
                switch (result) {
                  case BannerAdResult.ERROR:
                    log("Facebook Banner Ad Error: $value");
                    break;
                  case BannerAdResult.LOADED:
                    log("Facebook Banner Ad Loaded: $value");
                    break;
                  case BannerAdResult.CLICKED:
                    log("Facebook Banner Ad Clicked: $value");
                    break;
                  case BannerAdResult.LOGGING_IMPRESSION:
                    log("Facebook Banner Ad Logging Impression: $value");
                    break;
                }
              },
            ),
          )
        : isBannerAdLoaded
            ? Container(
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                alignment: Alignment.center,
                child: AdWidget(
                  ad: _bannerAd!,
                ),
              )
            : const SizedBox();
  }

  Future<void> loadBannerAd() async {
    // final AnchoredAdaptiveBannerAdSize? size = await AdSize.getAnchoredAdaptiveBannerAdSize(
    //   Orientation.portrait,
    //   MediaQuery.of(context).size.width.truncate(),
    // );
    // if (size == null) {
    //   log('Unable to get height of anchored banner.');
    //   return;
    // }

    if (AdConstants.isShowFacebookBannerAds == false && AdConstants.isShowAds) {
      _bannerAd = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: AdConstants.bannerAdUnitId,
        listener: BannerAdListener(
          onAdLoaded: (Ad ad) {
            setState(() {
              isBannerAdLoaded = true;
            });
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
            log('$BannerAd failedToLoad: $error');
            ad.dispose();
          },
          onAdImpression: (Ad ad) {},
          onAdOpened: (Ad ad) {
            log('$BannerAd onAdOpened.');
          },
          onAdClosed: (Ad ad) => log('$BannerAd onAdClosed.'),
        ),
        request: const AdRequest(),
      );
      _bannerAd!.load();
    }
  }
}
