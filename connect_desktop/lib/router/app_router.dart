import 'package:connect_desktop/common/color_util.dart';
import 'package:connect_desktop/pages/command_page.dart';
import 'package:connect_desktop/pages/debug_page.dart';
import 'package:connect_desktop/pages/device_page.dart';
import 'package:connect_desktop/pages/lab_page.dart';
import 'package:connect_desktop/pages/settting_page.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppRouter {
  static PaneItem _paneItem({
    required String title,
    required IconData icon,
    required Widget body,
    Color? iconColor,
  }) {
    return PaneItem(
      icon: SizedBox(
        width: 25,
        child: Center(
          child: FaIcon(
            icon,
            color: iconColor,
            size: 16,
          ),
        ),
      ),
      title: Text(title),
      body: body,
    );
  }

  static List<NavigationPaneItem> paneItems = [
    _paneItem(
      title: '设备',
      icon: FontAwesomeIcons.mobileButton,
      iconColor: ColorUtil.hex('#3ad0ae'),
      body: const DevicePage(),
    ),
    _paneItem(
      title: '快捷指令',
      icon: FontAwesomeIcons.wandMagicSparkles,
      // icon: FontAwesomeIcons.wandSparkles,
      iconColor: ColorUtil.hex('#ff9066'),
      body: const CommandPage(),
    ),
    _paneItem(
      title: '实验室',
      // icon: FontAwesomeIcons.microscope,
      icon: FontAwesomeIcons.compassDrafting,
      iconColor: ColorUtil.hex('#5bbfff'),
      body: const LabPage(),
    ),
  ];

  static List<NavigationPaneItem> footerItems = [
    _paneItem(
      title: 'Debug',
      icon: FontAwesomeIcons.bug,
      iconColor: ColorUtil.hex('#d67af1'),
      body: const DebugPage(),
    ),
    _paneItem(
      title: '设置',
      icon: FontAwesomeIcons.gear,
      iconColor: ColorUtil.hex('#8e8e93'),
      body: const SettingPage(),
    ),
  ];
}
