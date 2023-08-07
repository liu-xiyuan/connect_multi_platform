import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:connect_desktop/style/app_theme.dart';
import 'package:connect_desktop/widgets/app_nav_view.dart';
import 'package:fluent_ui/fluent_ui.dart' hide Colors;
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 应用Mica样式
  await Window.initialize().then(
    (value) => Window.setEffect(
      effect: WindowEffect.mica,
      color: Colors.white,
      dark: false,
    ),
  );

  runApp(const MyApp());

  // 初始化窗口位置
  doWhenWindowReady(() {
    const initialSize = Size(1200, 720);
    const minSize = Size(875, 412);
    appWindow.minSize = minSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.data,
      home: const AppNavView(),
    );
  }
}
