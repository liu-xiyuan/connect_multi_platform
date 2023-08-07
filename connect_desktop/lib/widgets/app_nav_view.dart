import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:connect_desktop/common/color_util.dart';
import 'package:connect_desktop/router/app_router.dart';
import 'package:connect_desktop/style/app_theme.dart';
import 'package:connect_desktop/widgets/window_button_bar.dart';
import 'package:fluent_ui/fluent_ui.dart' hide Colors;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AppNavView extends StatelessWidget {
  const AppNavView({super.key});

  @override
  Widget build(BuildContext context) {
    var currentPage = 0.obs;

    return Obx(
      () => NavigationView(
        transitionBuilder: (child, animation) => DrillInPageTransition(
          animation: animation,
          child: child,
        ),
        appBar: NavigationAppBar(
          leading: Image.asset(
            'assets/images/launcher_icon_32.png',
            width: 20,
            height: 20,
          ).marginOnly(left: 0),
          actions: WindowTitleBarBox(
            child: Row(
              children: [
                Expanded(child: MoveWindow()),
                const WindowButtonBar(),
              ],
            ),
          ),
        ),
        pane: NavigationPane(
          selected: currentPage.value,
          indicator: StickyNavigationIndicator(
            color: ColorUtil.hex('#fb470a'),
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 50),
          ),
          onChanged: (index) => currentPage.value = index,
          size: const NavigationPaneSize(openMaxWidth: 200),
          displayMode: PaneDisplayMode.auto,
          items: AppRouter.paneItems,
          footerItems: AppRouter.footerItems,
        ),
      ),
    );
  }
}

/// 位于AppBar的TCP状态小标签
class StatusTag extends StatelessWidget {
  const StatusTag({
    Key? key,
    required this.onTap,
    required this.tagTitle,
    this.leading = const SizedBox(),
    this.backgroundColor = Colors.transparent,
    this.onLongPress,
  }) : super(key: key);

  final Function() onTap;
  final Function()? onLongPress;
  final Widget leading;
  final String tagTitle;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SpinKitDoubleBounce(
            color: Colors.green,
            duration: const Duration(seconds: 5),
            size: 8,
          ),
          Text(
            tagTitle,
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ).paddingSymmetric(horizontal: 10),
    );
  }
}
