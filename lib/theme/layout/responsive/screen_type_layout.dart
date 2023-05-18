import 'package:flutter/material.dart';
import 'package:repo_viewer/theme/layout/enums/device_screen_type.dart';
import 'package:repo_viewer/theme/layout/responsive/responsive_builder.dart';

class ScreenTypeLayout extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ScreenTypeLayout({
    super.key,
    this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return tablet!;
        }
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return desktop!;
        }
        return mobile!;
      },
    );
  }
}
