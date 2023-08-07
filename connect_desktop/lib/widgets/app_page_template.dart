import 'package:connect_desktop/style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AppPageTemplate extends StatelessWidget {
  const AppPageTemplate({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.data.typography.title,
          ),
          Expanded(child: child),
        ],
      ).paddingSymmetric(horizontal: 35, vertical: 30),
    );
  }
}
