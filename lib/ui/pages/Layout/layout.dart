

import 'package:location_app/core/provider/bottomNavigation/navigator_provider.dart';
import 'package:location_app/ui/pages/home/Home.dart';
import 'package:location_app/ui/pages/wallet/wallet.dart';
import 'package:flutter/material.dart';
import 'package:location_app/ui/pages/favors/favors.dart';
import 'package:location_app/ui/pages/monCompte/monCompte.dart';

import '../../../export.dart';
import '../historique/history.dart';



class layout extends StatefulWidget {
  const layout({Key? key}) : super(key: key);

  @override
  State<layout> createState() => _layoutState();
}

class _layoutState extends State<layout> {

  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  static final List<Widget> _widgetOption = [
    Home(),
    NewPost(),
    MyChat(),
    MonCompte(),
  ];

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: new Text('Quitter l\'application'),
        content: new Text('Etes vous sûr de quitter l\'application?'),
        actions: <Widget>[
          AppButton(onTap: () {
            Navigator.of(context).pop(false);
          },
            width: 61,
            height: 35,
            backgroundColor: AppColors.green.withOpacity(0.4),
            widget: Text('Non', style: AppTypography().regularAg12.copyWith(
                color: AppColors.black
            ),),
          ),
          AppButton(onTap: () {
            Navigator.of(context).pop(true);
          },
            width: 61,
            height: 35,
            backgroundColor: AppColors.red.withOpacity(0.4),
            widget: Text('Oui', style: AppTypography().regularAg12.copyWith(
                color: AppColors.black
            ),),
          ),
          /*TextButton(
            onPressed: () => Navigator.of(context).pop(false), //<-- SEE HERE
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true), // <-- SEE HERE
            child: new Text('Yes'),
          ),*/
        ],
      ),
    )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Center(child: _widgetOption.elementAt(_page)),
        bottomNavigationBar:
        Consumer<DashboardProvider>(builder: (context, qreturnHome, _) {
          _page = qreturnHome.index;
          /*if(qreturnHome.isreturn == true){
            final CurvedNavigationBarState? navBarState =
                _bottomNavigationKey.currentState;
            navBarState?.setPage(_page);
            qreturnHome.setIsReturn(false);
          }*/
          DashboardProvider returnHome = Provider.of<DashboardProvider>(context);
          return CurvedNavigationBar(
            key: qreturnHome.keyy,
            index: 0,
            height: 55.0,
            items: <Widget>[
              NavItem(text: 'Acceuil', iconData: Icons.home_rounded,page: 0, active_index: _page,),
              NavItem(text: 'Nouveau post', iconData: Icons.edit,page: 1, active_index: _page,),
              NavItem(text: 'Messages', iconData: Icons.chat,page: 2, active_index: _page,),
              NavItem(text: 'Mon compte', iconData: Icons.person_rounded,page: 3, active_index: _page,),
            ],
            color: AppColors.primaryTwo,
            buttonBackgroundColor: AppColors.primaryTwo,
            backgroundColor: Colors.white,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 600),
            onTap: (index) {
              print('avant '+'$_page');

              returnHome.setIndex(index);
              setState(() {
                _page = returnHome.index;
              });

              print('apres '+'$_page');
            },
            letIndexChange: (index) => true,
          );
        })

      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required int page, required this.active_index, required this.text, required this.iconData,
  }) : _page = page;

  final int _page;
  final int active_index;
  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Icon(iconData, size: 26, color: AppColors.white),

        Visibility(
          visible: _page == active_index ? false : true,
          child: Container(
            child: Column(

              children: [
                Text(text,
                style: AppTypography().itemLabel.copyWith(
                  color:  AppColors.white,
                ),),
              ],
            ),
          ),
        )
      ],
    );
  }
}
