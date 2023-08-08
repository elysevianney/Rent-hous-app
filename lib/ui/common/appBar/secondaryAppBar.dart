import 'package:location_app/export.dart';


class SecondaryAppbar extends StatelessWidget {
  SecondaryAppbar({Key? key, required this.title}) : super(key: key);
  final String title;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {

    return AppBar(
      backgroundColor: Colors.white,
      title: Text(title, style: AppTypography().medium.copyWith(
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
    );
  }
}
