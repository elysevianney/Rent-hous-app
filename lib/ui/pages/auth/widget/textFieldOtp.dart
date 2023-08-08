/*import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:visitbj/ressources/theme/app_theme.dart';

import '../../../../../ressources/theme/color/app_color.dart';
class TextFieldOTP extends StatefulWidget {
  const TextFieldOTP({Key? key, required this.first, this.last, this.validator}) : super(key: key);
  final bool first;
  final last;
  final String? Function(String?)? validator;

  @override
  State<TextFieldOTP> createState() => TextFieldOTPState();
}

class TextFieldOTPState extends State<TextFieldOTP> {
  final TextEditingController _controller = TextEditingController();

  bool _isFieldEmpty = true;
  @override
  void initState() {
    super.initState();
    _controller.addListener(_checkIfFieldEmpty);
  }

  void _checkIfFieldEmpty() {
    setState(() {
      _isFieldEmpty = _controller.text.isEmpty;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 50.h,
      child: TextFormField(
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],

        style: AppTypography().headline1
            .copyWith(fontWeight: FontWeight.w400),
        textAlignVertical: TextAlignVertical.center,
        controller: _controller,
          autofocus: true,
          maxLines: 1,
          onChanged: (value) {
            if (value.length == 1 && widget.last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && widget.first == false) {
              FocusScope.of(context).previousFocus();
            }
            if (value.length > 1) {
              value = value.substring(0, 1);
              _controller.text = value;
              _controller.selection = TextSelection.fromPosition(
                TextPosition(offset: value.length),
              );
            }

          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
          counterText: "",
          hintText: "-",
          border: OutlineInputBorder(
          borderSide: BorderSide(
          color: _isFieldEmpty ? AppColors.normalBlack : AppColors.hintColor,
          ),
        ),

          //maxLength: 1,
      ),)
    );
  }
}
*/