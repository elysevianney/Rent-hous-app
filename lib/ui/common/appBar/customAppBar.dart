import 'package:location_app/export.dart';

class AppBarCustom extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(
        Icons.menu,
        color: Colors.black,
        size: 32,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        "CinEvent",
        style: TextStyle(
          fontSize: 24,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Icon(
                Icons.notifications_none,
                color: Colors.black,
                size: 28,
              ),
            ],
          ),
        ),
      ],
    );


  }
}
