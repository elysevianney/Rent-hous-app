import 'package:location_app/export.dart';

class SbeeSuccessPage extends StatefulWidget {
  const SbeeSuccessPage({Key? key}) : super(key: key);

  @override
  State<SbeeSuccessPage> createState() => _SbeeSuccessPageState();
}

class _SbeeSuccessPageState extends State<SbeeSuccessPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset($AppAssets.svgs.onb3),
                    SizedBox(height: 15,),
                    Text('Paiement éffectué', style: AppTypography().medium.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black2
                    ),),
                  ],
                ),
              ),
            ),


          )
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Payer facture SBEE', style: AppTypography().medium.copyWith(
            fontSize: 18,
            color: AppColors.primaryTwo
        ),),
        centerTitle: true,
        leading: InkWell(
          highlightColor: AppColors.primaryTwo,
          onTap: (){
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: AppColors.black2,
            size: 25,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
                highlightColor: AppColors.primaryTwo,
                onTap: (){
                  _key.currentState?.openDrawer();
                  // Scaffold.of(context).openDrawer();
                },
                child: const Icon(Icons.menu, color: AppColors.black2, size: 25,)
            ),
          )
        ],
      ),
      drawer: MyDrawer(key2: _key,),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 60.h,
        color: Colors.white,
        padding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(left: 5),
                child: AppButton(
                  text: 'Retour à l\'acceuil',
                  textStyle:
                  AppTypography().getStartedDescription.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white
                  ),
                  backgroundColor: AppColors.primaryTwo,
                  onTap: () {},
                ),
              ),
            ),
            SizedBox(width: 8,),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(left: 5),
                child: AppButton(
                  text: 'Voir reçu',
                  textStyle:
                  AppTypography().getStartedDescription.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white
                  ),
                  backgroundColor: AppColors.primaryTwo,
                  onTap: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
