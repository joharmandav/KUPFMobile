import 'package:flutter/material.dart';

class KText extends StatelessWidget {
  final String string;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;

  const KText(this.string, {Key? key, this.style, this.textAlign, this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(string, style: style, textAlign: textAlign,maxLines: maxLines ?? 1,overflow: TextOverflow.ellipsis,);
  }
}