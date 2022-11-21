
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialIconWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color color;
  final IconData? icon;
  final String? path;

  const SocialIconWidget({Key? key, this.onPressed,required this.color, this.icon, this.path}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30)),
      child: icon != null ? IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        color: Colors.white,
        iconSize: 31,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ) : GestureDetector(onTap: onPressed, child: SvgPicture.asset(path!, width: 24, height: 24,),),
    );
  }
}
