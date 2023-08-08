import 'package:flutter/material.dart';
import '../../../ressources/theme/color/app_color.dart';
import '../../../ressources/theme/typography/app_typography.dart';
import '../app_inkwell.dart';


class AppButton extends StatelessWidget {
  const AppButton(
      {Key? key,
        this.backgroundColor,
        this.text,
        required this.onTap,
        this.textColor = Colors.white,
        this.height,
        this.textStyle,
        this.width,
        this.raduis,
        this.borderColor,
        this.widget,
        this.borderWith})
      : super(key: key);
  final String? text;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? height;
  final double? width;
  final double? borderWith;
  final BorderRadiusGeometry? raduis;
  final TextStyle? textStyle;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return AppInkwell(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryTwo,
          borderRadius: raduis ?? BorderRadius.circular(6),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: 1.0,
          ),

        ),
        child: widget?? Text(
          text??"",
          style:
          textStyle ?? AppTypography().buttonText.copyWith(color: textColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
