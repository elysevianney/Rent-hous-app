import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpaceW extends StatelessWidget {
  final num width;
  const SpaceW(this.width, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
    );
  }
}

class SpaceH extends StatelessWidget {
  final num height;
  const SpaceH(this.height, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
    );
  }
}


