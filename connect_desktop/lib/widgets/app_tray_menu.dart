import 'package:tray_manager/tray_manager.dart';

class AppTrayMenu {
  static Menu menulist = Menu(
    items: [
      MenuItem(
        key: 'check_device',
        label: '查看设备',
      ),
      MenuItem(
        key: 'network',
        label: '网络服务',
      ),
      MenuItem.separator(),
      MenuItem(
        key: 'setting',
        label: '设置',
      ),
      MenuItem.checkbox(
        checked: true,
        key: 'boot_up',
        label: '开机自启动',
      ),
      // MenuItem.submenu(
      //   label: '更多',
      //   submenu: Menu(
      //     items: [

      //       MenuItem(
      //         label: '检查网络',
      //       ),
      //     ],
      //   ),
      // ),
      MenuItem.separator(),
      MenuItem(
        key: 'help',
        label: '帮助',
      ),
      MenuItem.separator(),
      MenuItem(
        key: 'exit_app',
        label: '退出程序',
      ),
    ],
  );
}
