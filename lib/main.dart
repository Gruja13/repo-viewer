import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/core/presentation/routes/app_router.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _router = AppRouter();

  @override
  Widget build(BuildContext context) {
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
