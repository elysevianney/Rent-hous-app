import 'package:flutter/material.dart';


class AppColors {
  const AppColors._();

  static const Color primaryOne = Color(0xffFFB923);
  static const Color primaryTwo = Color(0xffFF9029);
  static const Color green = Color(0xff168039);
  static const Color nature = Color(0xff168039);
  static const Color subTitle = Color(0xffAEA9B1);
  static const Color orangeHint = Color(0xffFFF3E6);
  static const Color dividerColor = Color(0xffEFEFEF);
 // static const Color natureBg = Color(0xffF2FFF2);
  static const Color safari = Color(0xffB06005);
  static const Color safariBg = Color(0xffFFF3E6);
  static const Color aventure = Color(0xffFFB923);
 // static const Color aventureBg = Color(0xffFFFBF4);
  static const Color culture = Color(0xff2388FF);
  //static const Color cultureBg = Color(0xffE4F5FF);
  static const Color greenTint = Color(0xffF9FFF9);
  static const Color greenTintTwo = Color(0xffBEEEB7);
  static const Color greenThree = Color(0xffE4FBE1);
  static const Color primaryTintLight = Color(0xffFFF3E6);
  static const Color detailsColors = Color(0xff868383);
  static const Color stroke = Color(0xffC7C6CA);
  static const Color details = Color(0xff46474A);
  static const Color red = Color(0xffE30B00);
  static const Color tabViewBgColor = Color(0xffFFF8F0);
  static const Color redLight = Color(0xffFDF3F2);
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);
  static const Color black2 = Color(0xff1A1817);
  static const Color brown = Color(0xff50555C);
  static const Color outline = Color(0xff938F99);
  static const Color orange = Color(0xffB06005);
  static const Color greyScale = Color(0xff191825);
  static const Color categorie = Color(0xff5E5E62);
  static const Color neutral = Color(0xffE3E2E6);
  static const Color natureBg = Color(0xff159800);
  static const Color cultureBg = Color(0xff2388FF);
  static const Color aventureBg = Color(0xffCD8F09);
  static const Color familyBg = Color(0xff0645BE);
  static const Color detenteBg = Color(0xffF28406);
  static const Color balneaireBg = Color(0xff00A5C9);
  static const Color rate = Color(0xff8E9199);
  static const Color outlineVariant = Color(0xffC4C6CF);
  static const Color cartNote = Color(0xff96ED89);
  static const Color normalBlack = Color(0xff1A1817);
  static const Color hintColor = Color(0xff8C8B92);
  static Color stackCategory = const Color(0xffFFD3A1).withOpacity(0.32);
  static Color appBarMailBg = const Color(0xffF5F5F5);
  //static const Color outline = Color(0xff8E9199);

  static getColor(String libelle) {
    switch (libelle) {
      case "Nature":
        return AppColors.nature;
      case "Safari":
        return AppColors.safari;
      case "Aventure":
        return AppColors.aventure;
      case "Culture":
        return AppColors.culture;
      default:
    }
  }

  static getColorBg(String libelle) {
    switch (libelle) {
      case "Nature":
        return AppColors.natureBg.withOpacity(0.2);

      case "Safari":
        return AppColors.safariBg.withOpacity(0.2);

      case "Aventure":
        return AppColors.aventureBg.withOpacity(0.2);

      case "Culture":
        return AppColors.cultureBg.withOpacity(0.2);

      default:
    }
  }
}