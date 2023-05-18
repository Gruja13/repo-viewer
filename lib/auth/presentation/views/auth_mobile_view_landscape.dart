import 'package:flutter/material.dart';
import 'package:repo_viewer/auth/presentation/widgets/auth_body_landscape.dart';

class AuthMobileViewLandscape extends StatelessWidget {
  const AuthMobileViewLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AuthBodyLandscape(),
    );
  }
}
