import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class StarredViewPortrait extends StatelessWidget {
  const StarredViewPortrait({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StarredViewPortrait'),
      ),
      body: const Center(
        child: Text('StarredViewPortrait is working'),
      ),
    );
  }
}
