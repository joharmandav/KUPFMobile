import 'package:flutter/material.dart';
import 'package:kupf/presentation/screen/sigin_view/sigin_view.dart';
import 'package:kupf/widgets/k_text.dart';

class KTextField extends StatelessWidget {
  final TextEditingController? editingController;
  final String? hintText;
  final String? title;
  final Widget? suffixIcon;
  final bool readOnly;

  const KTextField({Key? key,
    this.editingController,
    this.hintText,
    this.title,
    this.suffixIcon,
    this.readOnly = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSpacing.vertical,
        title == null
            ? AppSpacing.emptyBox
            : KText(title!,
            style: Theme
                .of(context)
                .textTheme
                .bodyText1!
                .copyWith(letterSpacing: 2)),
        AppSpacing.vertical,
        TextField(
          controller: editingController,
          readOnly: readOnly,
          decoration:
          InputDecoration(hintText: hintText, suffixIcon: suffixIcon),
        ),
      ],
    );
  }
}

class LabelTextField extends StatelessWidget {
  final String? labelText;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final String? hintText;
  final Widget? suffixIcon;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool obscureText;
  final TextInputType? keyboardType;

  const LabelTextField({Key? key,
    this.labelText,
    this.controller,
    this.prefixIcon,
    this.validator,
    this.autovalidateMode,
    this.hintText,
    this.obscureText = false,
    this.suffixIcon, this.keyboardType, this.readOnly = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon,
          hintText: hintText,
          suffixIcon: suffixIcon),
    );
  }
}
