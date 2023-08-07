import 'package:connect_desktop/controller/device_controller.dart';
import 'package:connect_desktop/widgets/app_page_template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DevicePage extends GetView<DeviceController> {
  const DevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageTemplate(
      title: '设备',
      child: Container(),
    );
  }
}
