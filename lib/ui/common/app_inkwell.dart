import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class AppInkwell extends StatelessWidget {
  const AppInkwell({Key? key, required this.onTap, required this.child})
      : super(key: key);
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: child,
    );
  }
}
