import 'package:auto_route/src/route/page_route_info.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/auth/shared/providers.dart';
import 'package:repo_viewer/core/presentation/routes/app_router.dart';
import 'package:repo_viewer/core/presentation/routes/app_router.gr.dart';

final initializationProvider = FutureProvider<Unit>(
  (ref) async {
    final authNotifier = ref.read(authNotifierProvider.notifier);
    await authNotifier.checkAndUpdateAuthStatus();
    return unit;
  },
);

class AppWidget extends ConsumerWidget {
  final AppRouter _router = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationProvider, (previous, next) {
      next.maybeMap(
        orElse: () {},
        data: (_) {
          _router.pushAndPopUntil(
            const StarredViewPortrait(),
            predicate: (_) => false,
          );
        },
      );
    });
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Repo Viewer',
      routerDelegate: _router.delegate(),
      routeInformationParser: _router.defaultRouteParser(),
      // home: ScreenTypeLayout(
      //   mobile: OrientationLayout(
      //     portrait: SplashViewPortrait(),
      //   ),
      // ),
    );
  }
}
