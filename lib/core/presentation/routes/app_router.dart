import 'package:auto_route/auto_route.dart';

import 'package:repo_viewer/core/presentation/routes/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashViewPortrait.page, initial: true, path: '/splash_view_portrait'),
    AutoRoute(page: SignInViewPortrait.page, path: '/sign_in_view_portrait'),
    AutoRoute(page: StarredViewPortrait.page, path: '/starred_view_portrait'),
  ];
}
