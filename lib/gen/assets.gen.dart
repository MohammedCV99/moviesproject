// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsGen {
  const $AssetsGen();

  /// Directory path: Assets/images
  $AssetsImagesGen get images => const $AssetsImagesGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: Assets/images/AvailableNow.png
  AssetGenImage get availableNow =>
      const AssetGenImage('Assets/images/AvailableNow.png');

  /// File path: Assets/images/Avater1.png
  AssetGenImage get avater1 => const AssetGenImage('Assets/images/Avater1.png');

  /// File path: Assets/images/Avater2.png
  AssetGenImage get avater2 => const AssetGenImage('Assets/images/Avater2.png');

  /// File path: Assets/images/Avater3.png
  AssetGenImage get avater3 => const AssetGenImage('Assets/images/Avater3.png');

  /// File path: Assets/images/Avater4.png
  AssetGenImage get avater4 => const AssetGenImage('Assets/images/Avater4.png');

  /// File path: Assets/images/Avater5.png
  AssetGenImage get avater5 => const AssetGenImage('Assets/images/Avater5.png');

  /// File path: Assets/images/Avater6.png
  AssetGenImage get avater6 => const AssetGenImage('Assets/images/Avater6.png');

  /// File path: Assets/images/Avater7.png
  AssetGenImage get avater7 => const AssetGenImage('Assets/images/Avater7.png');

  /// File path: Assets/images/Avater8.png
  AssetGenImage get avater8 => const AssetGenImage('Assets/images/Avater8.png');

  /// File path: Assets/images/Avater9.png
  AssetGenImage get avater9 => const AssetGenImage('Assets/images/Avater9.png');

  /// File path: Assets/images/Branding.png
  AssetGenImage get branding =>
      const AssetGenImage('Assets/images/Branding.png');

  /// File path: Assets/images/Forgetpassword.png
  AssetGenImage get forgetpassword =>
      const AssetGenImage('Assets/images/Forgetpassword.png');

  /// File path: Assets/images/Forgot_password_img.png
  AssetGenImage get forgotPasswordImg =>
      const AssetGenImage('Assets/images/Forgot_password_img.png');

  /// File path: Assets/images/MainLogo.png
  AssetGenImage get mainLogo =>
      const AssetGenImage('Assets/images/MainLogo.png');

  /// File path: Assets/images/MoviesPoster1.png
  AssetGenImage get moviesPoster1 =>
      const AssetGenImage('Assets/images/MoviesPoster1.png');

  /// File path: Assets/images/MoviesPoster2.png
  AssetGenImage get moviesPoster2 =>
      const AssetGenImage('Assets/images/MoviesPoster2.png');

  /// File path: Assets/images/MoviesPoster3.png
  AssetGenImage get moviesPoster3 =>
      const AssetGenImage('Assets/images/MoviesPoster3.png');

  /// File path: Assets/images/MoviesPoster4.png
  AssetGenImage get moviesPoster4 =>
      const AssetGenImage('Assets/images/MoviesPoster4.png');

  /// File path: Assets/images/MoviesPoster5.jpg
  AssetGenImage get moviesPoster5 =>
      const AssetGenImage('Assets/images/MoviesPoster5.jpg');

  /// File path: Assets/images/MoviesPoster6.jpg
  AssetGenImage get moviesPoster6 =>
      const AssetGenImage('Assets/images/MoviesPoster6.jpg');

  /// File path: Assets/images/PlayLogo.png
  AssetGenImage get playLogo =>
      const AssetGenImage('Assets/images/PlayLogo.png');

  /// File path: Assets/images/Search.png
  AssetGenImage get search => const AssetGenImage('Assets/images/Search.png');

  /// File path: Assets/images/WatchNow.png
  AssetGenImage get watchNow =>
      const AssetGenImage('Assets/images/WatchNow.png');

  /// File path: Assets/images/arLogo.png
  AssetGenImage get arLogo => const AssetGenImage('Assets/images/arLogo.png');

  /// File path: Assets/images/email_icon.svg
  String get emailIcon => 'Assets/images/email_icon.svg';

  /// File path: Assets/images/email_logoo.png
  AssetGenImage get emailLogoo =>
      const AssetGenImage('Assets/images/email_logoo.png');

  /// File path: Assets/images/enLogo.png
  AssetGenImage get enLogo => const AssetGenImage('Assets/images/enLogo.png');

  /// File path: Assets/images/google.png
  AssetGenImage get google => const AssetGenImage('Assets/images/google.png');

  /// File path: Assets/images/google_icon.svg
  String get googleIcon => 'Assets/images/google_icon.svg';

  /// File path: Assets/images/pasword_logo.png
  AssetGenImage get paswordLogo =>
      const AssetGenImage('Assets/images/pasword_logo.png');

  /// List of all assets
  List<dynamic> get values => [
    availableNow,
    avater1,
    avater2,
    avater3,
    avater4,
    avater5,
    avater6,
    avater7,
    avater8,
    avater9,
    branding,
    forgetpassword,
    forgotPasswordImg,
    mainLogo,
    moviesPoster1,
    moviesPoster2,
    moviesPoster3,
    moviesPoster4,
    moviesPoster5,
    moviesPoster6,
    playLogo,
    search,
    watchNow,
    arLogo,
    emailIcon,
    emailLogoo,
    enLogo,
    google,
    googleIcon,
    paswordLogo,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsGen assets = $AssetsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
