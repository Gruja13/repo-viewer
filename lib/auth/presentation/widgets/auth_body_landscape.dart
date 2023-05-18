import 'package:flutter/material.dart';

class AuthBodyLandscape extends StatelessWidget {
  const AuthBodyLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 200.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 232.0,
          margin: const EdgeInsets.only(top: 16.0, right: 32.0, bottom: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blueAccent),
          ),
        ),
      ],
    );
  }
}
