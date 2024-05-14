import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AssetsUtils {
  static final AssetsUtils _instance = AssetsUtils._internal();
  factory AssetsUtils() {
    return _instance;
  }
  AssetsUtils._internal();

  static const String emojiLevelIntimate = "assets/icons/level_intimate.png";
  static const String emojiLevelClose = "assets/icons/level_close.png";
  static const String emojiLevelCasual = "assets/icons/level_casual.png";
  static const String emojiLevelAcquaintance =
      "assets/icons/level_acquaintance.png";
  static const String emojiLevelNasty = "assets/icons/level_nasty.png";

  // PNG or JPG
  static Future<void> imagePrecache(BuildContext context) async {
    const imageAssets = [
      AssetsUtils.emojiLevelIntimate,
      AssetsUtils.emojiLevelClose,
      AssetsUtils.emojiLevelCasual,
      AssetsUtils.emojiLevelAcquaintance,
      AssetsUtils.emojiLevelNasty,
    ];

    for (var imagePath in imageAssets) {
      await precacheImage(AssetImage(imagePath), context);
    }
  }

  /// Skipping SVGs for now.
  /// I'm not sure if the ones I'm using are too heavy in terms of performance.
  static const String emojiIntimate = "assets/icons/intimate_someone.svg";
  static const String emojiClose = "assets/icons/close_someone.svg";

  static Future<void> svgPrecacheImages(BuildContext context) async {
    // SVGs
    const cacheSvgImages = [
      AssetsUtils.emojiIntimate,
      AssetsUtils.emojiClose,
    ];

    for (var element in cacheSvgImages) {
      var loader = SvgAssetLoader(element);
      svg.cache
          .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }
  }
}
