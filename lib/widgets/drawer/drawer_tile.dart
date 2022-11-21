import 'package:flutter/material.dart';
import '../../app_utility/app_text_theme.dart';
import '../k_text.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Widget? leading;

  const DrawerTile({Key? key, required this.title, this.onTap, this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: KText(title, style: AppTextTheme.bodyText1white),
      onTap: onTap,
    );
  }
}