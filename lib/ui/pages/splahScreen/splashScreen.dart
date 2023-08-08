import 'dart:async';

import 'package:location_app/export.dart';
import 'package:location_app/ressources/theme/app_theme.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends  State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), (){
     context.pushReplacement(AppPage.onBoarding.toPath);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryTwo,
      body: Center(
        child: SvgPicture.asset(
            $AppAssets.svgs.logo,
        ),
      ),
    );
  }
}


