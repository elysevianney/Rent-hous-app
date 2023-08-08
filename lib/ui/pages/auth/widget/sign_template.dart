import 'package:location_app/export.dart';

import '../../../../ressources/theme/color/app_color.dart';
import '../../../../utils_/constants/space.dart';


class SignTemplate extends StatelessWidget {
  const SignTemplate(
      {super.key,
      required this.widget,
      required this.title,
      this.useSocial = true});
  final Widget widget;
  final String title;
  final bool useSocial;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         Padding(
             padding: const EdgeInsets.only(bottom: 38,left: 25,right: 25),
           child:  Align(
             alignment: Alignment.bottomCenter,
             child: RichText(
               textAlign: TextAlign.center,
               text: TextSpan(
                   text: "En vous inscrivant vous acceptez notre ",
                   style: AppTypography().authText,
                   children: [
                     TextSpan(
                       text: "politique de confidentialité ",
                       style: AppTypography().authText.copyWith(
                           fontWeight: FontWeight.w300,
                           color: Colors.green),
                     ),
                     TextSpan(
                       text: "&",
                       style: AppTypography().authText,
                     ),
                     TextSpan(
                       text: " Nos termes et conditions. ",
                       style: AppTypography().authText.copyWith(
                           fontWeight: FontWeight.w300,
                           color: Colors.green),
                     )
                   ]),
             ),
           ),
         )
        ],
      ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SpaceH(50),
              Text(
                title,
                style: AppTypography().headline3.copyWith(color: Colors.blue),
                textAlign: TextAlign.center,
              ),
              const SpaceH(24),
              Expanded(child: SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  children: [
                    widget,
                    const SpaceH(24),
                    const SizedBox.shrink(),
                  ],
                ),
              )

              ),


            ],
          ),
        ),
    );
  }
}
