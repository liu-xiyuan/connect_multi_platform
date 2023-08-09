import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:connect_desktop/common/color_util.dart';
import 'package:connect_desktop/router/app_router.dart';
import 'package:connect_desktop/widgets/window_button_bar.dart';
import 'package:fluent_ui/fluent_ui.dart' hide Colors;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

/// Fluent样式的窗口
class AppWindowFluent extends StatelessWidget {
  const AppWindowFluent({super.key});

  @override
  Widget build(BuildContext context) {
    var currentPage = 4.obs;

    return Obx(
      () => NavigationView(
        transitionBuilder: (child, animation) => DrillInPageTransition(
          animation: animation,
          child: child,
        ),
        appBar: NavigationAppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Image.asset(
                'assets/images/app_icon_32.png',
                width: 20,
                height: 20,
              ).marginOnly(left: 2, right: 13),
              const Text('Connect'),
            ],
          ),
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
          onChanged: (index) => currentPage.value = index,
          indicator: StickyNavigationIndicator(
            color: ColorUtil.hex('#4c5f6b'),
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 50),
          ),
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
          const SpinKitDoubleBounce(
            color: Colors.green,
            duration: Duration(seconds: 5),
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
