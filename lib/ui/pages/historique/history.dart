import 'package:location_app/export.dart';

import '../../../core/provider/bottomNavigation/navigator_provider.dart';
import '../../common/drawer/drawer.dart';
class Histories extends StatefulWidget {
  const Histories({Key? key}) : super(key: key);

  @override
  State<Histories> createState() => _HistoriesState();
}

class _HistoriesState extends State<Histories> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    DashboardProvider returnHome = Provider.of<DashboardProvider>(context);
    return Scaffold(
     body: ListView(
       children: [

       ],
     ),
      key: _key,
      drawer: MyDrawer(key2: _key,),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Nouveau Post', style: AppTypography().medium.copyWith(
            fontSize: 16,
            color: AppColors.primaryTwo
        ),),
        centerTitle: false,
        leading: InkWell(
          highlightColor: AppColors.primaryTwo,
          onTap: (){
            returnHome.setIndex(0);
            returnHome.setIsReturn(true);
            returnHome.setEtat(0);

            int lol = returnHome.index;
            //print('mon compte cliqué :' + '$lol');
            // _key.currentState?.openDrawer();
            // Scaffold.of(context).openDrawer();
            // _key.currentState?.openDrawer();
            // Scaffold.of(context).openDrawer();
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: AppColors.black2,
            size: 25,
          ),
        ),

      ),
    );
  }
}

class historyElement extends StatelessWidget {
  const historyElement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 17,
                spreadRadius: 10,
                offset: Offset(0, 0)
            )
          ]
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('-100000 FCFA', style: AppTypography().medium.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.red
              ),),
              Text('18 jul 2023 | 18h20', style: AppTypography().medium.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.brown.withOpacity(0.5)
              ),),
          ],),
          const SizedBox(height: 8,),
          Row(
            children: [
              Text('Solde: ', style: AppTypography().medium.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.brown.withOpacity(0.5)
              ),),
              Text('568952 FCFA', style: AppTypography().medium.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.brown.withOpacity(0.5)
              ),),
            ],),
          const SizedBox(height: 8,),
          Row(
            children: [
              Text('Paiement fature SBEE', style: AppTypography().medium.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black2
              ),),
            ],),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('N° du compteur', style: AppTypography().medium.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.brown.withOpacity(0.5)
              ),),
              Text('9865325232', style: AppTypography().medium.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.brown.withOpacity(0.5)
              ),),
            ],),
        ],
      ),
    );
  }
}
