import 'package:flutter/material.dart';
import 'package:repo_viewer/auth/presentation/views/auth_mobile_view_portrait.dart';
import 'package:repo_viewer/theme/layout/responsive/orientation_layout.dart';
import 'package:repo_viewer/theme/layout/responsive/screen_type_layout.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Repo Viewer',
      home: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: AuthMobileViewPortrait(),
        ),
      ),
    );
  }
}
