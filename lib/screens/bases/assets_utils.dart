import 'package:flutter/material.dart';

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
}
