import 'dart:developer';
import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:connect_desktop/widgets/app_tray_menu.dart';
import 'package:get/get.dart';
import 'package:tray_manager/tray_manager.dart';

/// 系统托盘菜单Controller
class TrayMenuController extends GetxController with TrayListener {
  static TrayMenuController get to => Get.find();

  var count = 0.obs;

  @override
  void onInit() async {
    await trayManager.setIcon(
      Platform.isWindows
          ? 'assets/images/app_icon.ico'
          : 'assets/images/app_icon_32.png',
    );

    await trayManager.setContextMenu(AppTrayMenu.menulist);
    await trayManager.setToolTip('Connect');

    trayManager.addListener(this);

    super.onInit();
  }

  increase() {
    count.value++;
    log('message $count');
  }

  // 鼠标左击
  @override
  void onTrayIconMouseDown() {
    appWindow.show();
    appWindow.restore();
    super.onTrayIconMouseDown();
  }

  @override
  void onTrayIconMouseUp() {
    // TODO: implement onTrayIconMouseUp
    super.onTrayIconMouseUp();
  }

  // 鼠标右击
  @override
  void onTrayIconRightMouseDown() {
    // TODO: implement onTrayIconRightMouseDown
    trayManager.popUpContextMenu();
    super.onTrayIconRightMouseDown();
  }

  @override
  void onTrayIconRightMouseUp() {
    // TODO: implement onTrayIconRightMouseUp
    super.onTrayIconRightMouseUp();
  }

  // 菜单items监听
  @override
  void onTrayMenuItemClick(MenuItem menuItem) {
    String key = menuItem.key ?? '';

    if (key == 'show_window') {
      appWindow.show();
    } else if (key == 'exit_app') {
      appWindow.close();
    } else if (key == 'test') {
      increase();
    }
    super.onTrayMenuItemClick(menuItem);
  }

  @override
  void onClose() {
    trayManager.removeListener(this);
    super.onClose();
  }
}
