import 'package:connect_desktop/controller/service/setting_service.dart';
import 'package:connect_desktop/style/app_theme.dart';
import 'package:connect_desktop/widgets/about_sheet.dart';
import 'package:connect_desktop/widgets/app_page_template.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

class SettingPage extends GetView<SettingService> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageTemplate(
      title: '设置',
      children: [
        FilledButton(
          child: const Text('关于Connect'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => ContentDialog(
                constraints:
                    const BoxConstraints(minWidth: 300, maxHeight: 600),
                content: const AboutSheet(),
                style: AppTheme.fluent.dialogTheme,
              ),
              barrierColor: Colors.transparent,
              barrierDismissible: true,
            );
          },
        ),
      ],
    );
  }
}
