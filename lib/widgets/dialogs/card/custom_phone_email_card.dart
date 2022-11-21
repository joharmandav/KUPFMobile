import 'package:flutter/material.dart';

import '../../../app_utility/common_function.dart';

class CustomPhoneEmailCard extends StatelessWidget {
  const CustomPhoneEmailCard({
    Key? key,
    required this.iconData,
    required this.subtitle,
    required this.title,
    required this.onTab,
  }) : super(key: key);

  final IconData iconData;
  final String title;
  final String subtitle;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTab,
      contentPadding: const EdgeInsets.all(16),
      tileColor: Colors.grey.withOpacity(0.2),
      leading: Icon(iconData),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          AppUtility.heightBoxMin,
          Text(
            subtitle,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
