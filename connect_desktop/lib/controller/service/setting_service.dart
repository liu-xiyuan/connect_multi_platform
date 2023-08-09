import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingService extends GetxService {
  var hello = 'hello'.obs;

  Future<SettingService> init() async {
    initWindow();

    // 禁用GoogleFonts使用HTTP请求字体
    GoogleFonts.config.allowRuntimeFetching = false;
    return this;
  }

  /// 初始化窗口设置
  Future<void> initWindow() async {
    await Window.initialize().then(
      (value) => Window.setEffect(
        effect: WindowEffect.mica,
        color: Colors.white,
        dark: false,
      ),
    );
    doWhenWindowReady(() {
      appWindow.size = const Size(1200, 720);
      appWindow.alignment = Alignment.center;
      appWindow.minSize = const Size(875, 412);
      appWindow.show();
    });
  }
}
