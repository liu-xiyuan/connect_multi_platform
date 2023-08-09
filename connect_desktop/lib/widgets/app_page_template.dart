import 'package:connect_desktop/style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPageTemplate extends StatelessWidget {
  const AppPageTemplate({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
            children: [
              Text(
                title,
                style: AppTheme.fluent.typography.title,
              ).marginOnly(bottom: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ).marginOnly(
                right: constraints.maxWidth < 1000
                    ? 0
                    : constraints.maxWidth - 1000,
              ),
            ],
          );
        },
      ),
    );
  }
}
