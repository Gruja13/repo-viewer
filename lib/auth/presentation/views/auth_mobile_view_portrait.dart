import 'package:flutter/material.dart';
import 'package:repo_viewer/auth/presentation/widgets/auth_body_portrait.dart';
import 'package:repo_viewer/auth/presentation/widgets/side_menu.dart';

class AuthMobileViewPortrait extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  AuthMobileViewPortrait({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Drawer(
        child: SideMenu(),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            const AuthBodyPortrait(),
          ],
        ),
      ),
    );
  }
}
