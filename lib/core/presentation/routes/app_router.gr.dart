// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:repo_viewer/auth/presentation/views/sign_in_view_portrait.dart'
    as _i1;
import 'package:repo_viewer/Feature/splash_view/presentation/splash_view_portrait.dart'
    as _i2;
import 'package:repo_viewer/Feature/starred_repo/presentation/starred_view_portrait.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SignInViewPortrait.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SignInViewPortrait(),
      );
    },
    SplashViewPortrait.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SplashViewPortrait(),
      );
    },
    StarredViewPortrait.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.StarredViewPortrait(),
      );
    },
  };
}

/// generated route for
/// [_i1.SignInViewPortrait]
class SignInViewPortrait extends _i4.PageRouteInfo<void> {
  const SignInViewPortrait({List<_i4.PageRouteInfo>? children})
      : super(
          SignInViewPortrait.name,
          initialChildren: children,
        );

  static const String name = 'SignInViewPortrait';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SplashViewPortrait]
class SplashViewPortrait extends _i4.PageRouteInfo<void> {
  const SplashViewPortrait({List<_i4.PageRouteInfo>? children})
      : super(
          SplashViewPortrait.name,
          initialChildren: children,
        );

  static const String name = 'SplashViewPortrait';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.StarredViewPortrait]
class StarredViewPortrait extends _i4.PageRouteInfo<void> {
  const StarredViewPortrait({List<_i4.PageRouteInfo>? children})
      : super(
          StarredViewPortrait.name,
          initialChildren: children,
        );

  static const String name = 'StarredViewPortrait';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
