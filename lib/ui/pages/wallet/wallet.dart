import 'package:location_app/export.dart';

import '../../../core/provider/bottomNavigation/navigator_provider.dart';
import '../../common/drawer/drawer.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    DashboardProvider returnHome = Provider.of<DashboardProvider>(context);
    return Scaffold(
      body:   ListView(children: [

      ],),
      key: _key,
      drawer: MyDrawer(key2: _key,),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Messages', style: AppTypography().medium.copyWith(
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

            int lol = returnHome.index;
            // _key.currentState?.openDrawer();
            // Scaffold.of(context).openDrawer();
          },
          child: Icon(
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
                child: Icon(Icons.filter_list, color: AppColors.black2, size: 25,)
            ),
          )
        ],
      ),
    );
  }
}
