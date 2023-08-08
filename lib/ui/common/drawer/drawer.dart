import 'package:location_app/export.dart';

class MyDrawer extends StatefulWidget {
   MyDrawer({Key? key, required GlobalKey<ScaffoldState> key2}) : super(key: key);
  final GlobalKey<ScaffoldState> key2 = GlobalKey();
  @override
  State<MyDrawer> createState() => _MyDrawerState(key2);
}

class _MyDrawerState extends State<MyDrawer> {
  _MyDrawerState(GlobalKey<ScaffoldState> key2);
  final GlobalKey<ScaffoldState> key2 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: const EdgeInsets.only(left: 16),
                child: Text('Menu', style: AppTypography().medium.copyWith(
                    color: AppColors.primaryTwo
                ),),),
              Padding(padding: const EdgeInsets.only(right: 16),
                child: InkWell(
                  highlightColor: AppColors.primaryTwo,
                  onTap: (){

                    //key2.currentState?.closeDrawer();
                    Scaffold.of(context).closeDrawer();
                  },
                  child: const Icon(
                    Icons.clear,
                    color: AppColors.black2,
                    size: 25,
                  ),
                ),)
            ],
          ),
          const SizedBox(height: 20,),
          const SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                //Text('EDDY MENSAH', style: AppTypography().welcome.copyWith(color: AppColors.black2),),

                Column(children: [
                  MonCompteElement(label: 'Paramètres', icon: Icons.settings,),
                  MonCompteElement(label: 'Contacter le service client', icon: Icons.question_mark,),
                  MonCompteElement(label: 'Partager l\'application', icon: Icons.share,),
                  MonCompteElement(label: 'A propos', icon: Icons.info_outline_rounded,),
                  MonCompteElement(label: 'Déconnexion', icon: Icons.logout,)
                ],)

              ],
            )
            ,)
        ],
      ),
    );
  }
}

class MonCompteElement extends StatelessWidget {
  const MonCompteElement({
    super.key, required this.label, required this.icon,
  });
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: (){

            },
            highlightColor: AppColors.orangeHint,
            hoverColor: AppColors.orangeHint,
            focusColor: AppColors.orangeHint,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 12, right: 16, left: 20, bottom: 6),
              child:  Row(
                children: [
                  Icon(icon, size: 22, color: AppColors.primaryTwo,),
                  const SizedBox(width: 15,),
                  Text(label, style: AppTypography().regularAg16.copyWith(color: AppColors.black2, fontWeight: FontWeight.w400),),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}