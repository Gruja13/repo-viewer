import 'package:flutter/material.dart';

class AuthBodyPortrait extends StatelessWidget {
  const AuthBodyPortrait({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16.0, top: 42.0, right: 16.0),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Mobile Auth Portrait Screen'),
          ],
        ),
      ),
    );
  }
}
