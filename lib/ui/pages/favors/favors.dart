import 'package:location_app/export.dart';

import '../../../core/provider/favorsProvider.dart';

class Favors extends StatefulWidget {
  const Favors({Key? key}) : super(key: key);

  @override
  State<Favors> createState() => _FavorsState();
}

class _FavorsState extends State<Favors> {
  @override
  Widget build(BuildContext context) {
    FavorsProvider _favorProvider = Provider.of<FavorsProvider>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Vos favoris",
            style: TextStyle(fontSize: 24, color: Colors.blue),
          ),
          centerTitle: true,
        ),
        body: Center(
                child: Text('favors')
              )
    );
  }
}
