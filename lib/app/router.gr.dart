// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:gital_flutter/app/modules/analysis/presentation/pages/analysis_page.dart'
    as _i1;
import 'package:gital_flutter/app/modules/home/presentation/pages/home_page.dart'
    as _i2;
import 'package:gital_flutter/app/modules/intro/presentation/intro_page.dart'
    as _i3;
import 'package:gital_flutter/app/modules/main/presentation/pages/main_bottom_navigation_page.dart'
    as _i4;
import 'package:gital_flutter/app/modules/user/presentation/pages/user_page.dart'
    as _i5;

/// generated route for
/// [_i1.AnalysisPage]
class AnalysisRoute extends _i6.PageRouteInfo<void> {
  const AnalysisRoute({List<_i6.PageRouteInfo>? children})
    : super(AnalysisRoute.name, initialChildren: children);

  static const String name = 'AnalysisRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.AnalysisPage();
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.IntroPage]
class IntroRoute extends _i6.PageRouteInfo<void> {
  const IntroRoute({List<_i6.PageRouteInfo>? children})
    : super(IntroRoute.name, initialChildren: children);

  static const String name = 'IntroRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.IntroPage();
    },
  );
}

/// generated route for
/// [_i4.MainBottomNavigationPage]
class MainBottomNavigationRoute extends _i6.PageRouteInfo<void> {
  const MainBottomNavigationRoute({List<_i6.PageRouteInfo>? children})
    : super(MainBottomNavigationRoute.name, initialChildren: children);

  static const String name = 'MainBottomNavigationRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.MainBottomNavigationPage();
    },
  );
}

/// generated route for
/// [_i5.UserPage]
class UserRoute extends _i6.PageRouteInfo<void> {
  const UserRoute({List<_i6.PageRouteInfo>? children})
    : super(UserRoute.name, initialChildren: children);

  static const String name = 'UserRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.UserPage();
    },
  );
}
