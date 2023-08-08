import 'package:location_app/export.dart';
import 'package:location_app/ui/common/drawer/drawer.dart';

import '../../../core/provider/bottomNavigation/navigator_provider.dart';
import '../../common/app_inkwell.dart';

class MonCompte extends StatefulWidget {
  const MonCompte({Key? key}) : super(key: key);

  @override
  State<MonCompte> createState() => _MonCompteState();
}

class _MonCompteState extends State<MonCompte> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    DashboardProvider returnHome = Provider.of<DashboardProvider>(context);
    return Scaffold(
        key: _key,
        backgroundColor: Colors.white,
        drawer: MyDrawer(key2: _key,),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Mon comtpte', style: AppTypography().medium.copyWith(
              fontSize: 18,
              color: AppColors.primaryTwo
          ),),
          centerTitle: true,
          leading: InkWell(
            highlightColor: AppColors.primaryTwo,
            onTap: (){
              returnHome.setIndex(0);
              returnHome.setIsReturn(true);
              returnHome.setEtat(0);

             // int lol = returnHome.index;
              //print('mon compte cliqué :' + '$lol');
              // _key.currentState?.openDrawer();
              // Scaffold.of(context).openDrawer();
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: AppColors.black2,
              size: 25,
            ),
          ),

        ),
        body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 25, bottom: 25),
            child:  ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Stack(
                children: [
                  Container(
                    width: 66*1.5,
                    height: 66*1.5,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.hintColor, width: 3),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                  const Positioned(
                      top: 10,
                      left: -1,
                      child: Icon(Icons.person_rounded, color: AppColors.hintColor,
                        size: 69*1.5,
                      ),)
                ],
              ),
            ),
          ),
          Text('LALY Audrey', style: AppTypography().welcome.copyWith(color: AppColors.black2),),

          const Column(children: [
            MonCompteElement(label: 'Mes informations personnelles', icon: Icons.mode_edit_rounded,),
            MonCompteElement(label: 'Mes annonces', icon: Icons.edit_note_rounded,),
            MonCompteElement(label: 'Déconnexion', icon: Icons.logout,)
          ],)

        ],
      )

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
                  SizedBox(width: 15,),
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

