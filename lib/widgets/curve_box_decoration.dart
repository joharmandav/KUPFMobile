import 'package:flutter/material.dart';

class CurvedBoxDecoration extends StatelessWidget {
  final Widget child;

  const CurvedBoxDecoration({Key? key, required this.child,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        // color: scaffoldColor.value,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(34.0),
          topRight: Radius.circular(34.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 42.0,left: 16.0,right: 16.0),
        child: child,
      ),
    );
  }
}
