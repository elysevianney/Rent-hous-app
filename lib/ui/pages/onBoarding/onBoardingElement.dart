import 'package:location_app/export.dart';
import 'package:location_app/ressources/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatelessWidget {
  final String description;
  final String image;

  SliderPage({required this.description, required this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // SvgPicture.asset(image, width: width * 0.6,),
          SizedBox(height: 50,),
          Container(
            height: 268,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(image,),
              )
          ),
          SizedBox(height: 60.h,),
          Container(
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(description,
              softWrap: true,
              style: AppTypography().headline3.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                color: AppColors.black
              ),
              textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}