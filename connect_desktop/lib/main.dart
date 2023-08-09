import 'package:connect_desktop/controller/service/setting_service.dart';
import 'package:connect_desktop/controller/service/tcp_service.dart';
import 'package:connect_desktop/controller/tray_menu_controller.dart';
import 'package:connect_desktop/style/app_theme.dart';
import 'package:connect_desktop/widgets/app_window_fluent.dart';
import 'package:fluent_ui/fluent_ui.dart' hide Colors;
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

/// 初始化服务
Future<void> initServices() async {
  await Get.putAsync(() => SettingService().init());
  await Get.putAsync(() => TcpService().init());
  Get.put(TrayMenuController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      // showPerformanceOverlay: true,
      // showSemanticsDebugger: true, // 组件树调试
      debugShowCheckedModeBanner: false,
      theme: AppTheme.fluent,
      home: const AppWindowFluent(),
    );
  }
}
