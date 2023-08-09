import 'package:connect_desktop/common/color_util.dart';
import 'package:connect_desktop/style/app_theme.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/link.dart';

class AboutSheet extends StatelessWidget {
  const AboutSheet({super.key});

  Widget _buildLinkButton({
    required String link,
    required String label,
    IconData? icon,
    Color? iconColor,
    Color? textColor,
  }) {
    return Link(
      uri: Uri.parse(link),
      builder: (context, open) {
        return HyperlinkButton(
          onPressed: open,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null)
                FaIcon(
                  icon,
                  color: iconColor ?? Colors.black,
                ).marginOnly(right: 5),
              Text(
                label,
                style: TextStyle(color: textColor ?? Colors.blue),
              ),
            ],
          ),
        );
      },
    ).marginSymmetric(vertical: 10, horizontal: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/app_icon_128_transp.png',
          width: 90,
          height: 90,
        ),
        Text(
          'Connect',
          style: GoogleFonts.arizonia(
            textStyle: AppTheme.fluent.typography.titleLarge,
          ),
        ),
        Text(
          'version 1.0.0',
          style: AppTheme.fluent.typography.caption!
              .copyWith(color: Colors.grey[100]),
        ),
        _buildLinkButton(
          link: 'https://github.com/liuxiyuan-2022/connect_multi_platform',
          label: 'GitHub',
          icon: FontAwesomeIcons.github,
          textColor: Colors.black,
        ),
        _buildLinkButton(link: 'link', label: '获取最新客户端'),
        _buildLinkButton(link: 'link', label: '常见问题'),
        _buildLinkButton(link: 'link', label: '提示和技巧'),
        _buildLinkButton(link: 'link', label: '更新日志'),
        const Expanded(child: SizedBox()),
        Text(
          '多平台支持',
          style: AppTheme.fluent.typography.bodyStrong,
        ).marginOnly(top: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLinkButton(
              link:
                  'https://github.com/liuxiyuan-2022/connect_multi_platform/releases',
              label: 'Android',
              icon: FontAwesomeIcons.android,
              iconColor: ColorUtil.hex('#3ddc84'),
              textColor: Colors.black,
            ),
            _buildLinkButton(
              link:
                  'https://github.com/liuxiyuan-2022/connect_multi_platform/releases',
              label: 'iOS',
              icon: FontAwesomeIcons.appStoreIos,
              textColor: Colors.black,
            ),
            _buildLinkButton(
              link:
                  'https://github.com/liuxiyuan-2022/connect_multi_platform/releases',
              label: 'Windows',
              icon: FontAwesomeIcons.windows,
              iconColor: ColorUtil.hex('#0173d4'),
              textColor: Colors.black,
            ),
            _buildLinkButton(
              link:
                  'https://github.com/liuxiyuan-2022/connect_multi_platform/releases',
              label: 'macOS',
              icon: FontAwesomeIcons.apple,
              textColor: Colors.black,
            ),
          ],
        ),
      ],
    );
  }
}
