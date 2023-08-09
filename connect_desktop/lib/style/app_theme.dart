import 'package:fluent_ui/fluent_ui.dart';

class AppTheme {
  /// Windows主题样式
  ///
  /// TextStyle:[Typography.display], [Typography.title]
  /// [Typography.subtitle], [Typography.body], [Typography.caption]...
  ///
  static FluentThemeData fluent = FluentThemeData(
    fontFamily: 'Harmony',
    navigationPaneTheme: const NavigationPaneThemeData(
      backgroundColor: Colors.transparent,
    ),
    scaffoldBackgroundColor: Colors.white.withOpacity(.4),
    // buttonTheme: ButtonThemeData(
    //   hyperlinkButtonStyle: ButtonStyle(
    //     textStyle: ButtonState.all(const TextStyle(color: Colors.black)),
    //   ),
    // ),
    dialogTheme: const ContentDialogThemeData(
      barrierColor: Colors.transparent,
    ),
  );

  /// Mac主题样式
  // ...
}
