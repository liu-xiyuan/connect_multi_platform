import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';

class AppTheme {
  /// 样式
  static FluentThemeData data = FluentThemeData(
    fontFamily: Platform.isWindows ? 'Harmony' : '',
    // typography: Typography.raw(
    //   display: TextStyle(),
    // ),
    navigationPaneTheme: const NavigationPaneThemeData(
      backgroundColor: Colors.transparent,
    ),
    scaffoldBackgroundColor: Colors.white.withOpacity(.6),
  );
}
