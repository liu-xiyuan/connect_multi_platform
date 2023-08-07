import 'package:connect_desktop/pages/command_page.dart';
import 'package:connect_desktop/pages/device_page.dart';
import 'package:connect_desktop/pages/help_page.dart';
import 'package:connect_desktop/pages/lab_page.dart';
import 'package:connect_desktop/pages/settting_page.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppRouter {
  static PaneItem _paneItem({
    required String title,
    required IconData icon,
    required Widget body,
  }) {
    return PaneItem(
      icon: SizedBox(
        width: 15,
        child: Center(child: FaIcon(icon)),
      ),
      title: Text(title),
      body: body,
    );
  }

  static List<NavigationPaneItem> paneItems = [
    _paneItem(
      title: '设备',
      icon: FontAwesomeIcons.mobileButton,
      body: const DevicePage(),
    ),
    _paneItem(
      title: '快捷指令',
      icon: FontAwesomeIcons.wandMagicSparkles,
      body: const CommandPage(),
    ),
    _paneItem(
      title: '实验室',
      icon: FontAwesomeIcons.microscope,
      body: const LabPage(),
    ),
  ];

  static List<NavigationPaneItem> footerItems = [
    _paneItem(
      title: '帮助',
      icon: FontAwesomeIcons.solidCircleQuestion,
      body: const HelpPage(),
    ),
    _paneItem(
      title: '设置',
      icon: FontAwesomeIcons.gear,
      body: const SettingPage(),
    ),
  ];
}
