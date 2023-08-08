import 'package:location_app/export.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: SizedBox()),
            Container(
                height: 268,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset($AppAssets.svgs.getStarted,),
                )
            ),
            SizedBox(height: 20,),
            Text('C\'est parti!', style: AppTypography().getStarted,),
            SizedBox(height: 20,),
            Text('Utilisez désormais eHouse pour trouver facilement des appartements à louer ou pour mettre vos appartements en location',
                style: AppTypography().getStartedDescription,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            SizedBox(height: 60),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      context.push(AppPage.signIn.toPath);
                    },
                    child:
                    Text('Inscrivez-vous', style: AppTypography().getStartedButton.copyWith(color: AppColors.white)),
                    style:
                    ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryTwo,
                        padding: EdgeInsets.symmetric(
                            vertical: 12
                        ),
                        elevation: 0.0,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(15.0)))),
                  ),
                ),
              ],
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 8,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Déjà inscrit ? ', style: TextStyle(
                    color: AppColors.black2,
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),),
                  GestureDetector(
                    onTap: (){
                      context.push(AppPage.login.toPath);
                    },
                    child: Text('Se connecter', style: TextStyle(
                        color: AppColors.primaryTwo,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid
                    ),),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
