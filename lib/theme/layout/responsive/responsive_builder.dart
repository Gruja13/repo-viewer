import 'package:flutter/material.dart';
import 'package:repo_viewer/theme/layout/responsive/sizing_information.dart';
import 'package:repo_viewer/theme/layout/utils/ui_utils.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    SizingInformation sizingInformation,
  ) builder;
  const ResponsiveBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        final mediaQuery = MediaQuery.of(context);
        final sizingInformation = SizingInformation(
          deviceScreenType: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(
            boxConstraints.maxWidth,
            boxConstraints.maxHeight,
          ),
        );
        return builder(context, sizingInformation);
      },
    );
  }
}
