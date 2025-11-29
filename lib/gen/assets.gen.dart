// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/PretendardVariable.ttf
  String get pretendardVariable => 'assets/fonts/PretendardVariable.ttf';

  /// List of all assets
  List<String> get values => [pretendardVariable];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/plus.svg
  SvgGenImage get plus => const SvgGenImage('assets/icons/plus.svg');

  /// File path: assets/icons/selected-graduation-hat.svg
  SvgGenImage get selectedGraduationHat =>
      const SvgGenImage('assets/icons/selected-graduation-hat.svg');

  /// File path: assets/icons/selected-home.svg
  SvgGenImage get selectedHome =>
      const SvgGenImage('assets/icons/selected-home.svg');

  /// File path: assets/icons/selected-user.svg
  SvgGenImage get selectedUser =>
      const SvgGenImage('assets/icons/selected-user.svg');

  /// File path: assets/icons/unselected-graduation-hat.svg
  SvgGenImage get unselectedGraduationHat =>
      const SvgGenImage('assets/icons/unselected-graduation-hat.svg');

  /// File path: assets/icons/unselected-home.svg
  SvgGenImage get unselectedHome =>
      const SvgGenImage('assets/icons/unselected-home.svg');

  /// File path: assets/icons/unselected-user.svg
  SvgGenImage get unselectedUser =>
      const SvgGenImage('assets/icons/unselected-user.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    plus,
    selectedGraduationHat,
    selectedHome,
    selectedUser,
    unselectedGraduationHat,
    unselectedHome,
    unselectedUser,
  ];
}

class $AssetsLogosGen {
  const $AssetsLogosGen();

  /// File path: assets/logos/graduation-hat.svg
  SvgGenImage get graduationHat =>
      const SvgGenImage('assets/logos/graduation-hat.svg');

  /// List of all assets
  List<SvgGenImage> get values => [graduationHat];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsLogosGen logos = $AssetsLogosGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
