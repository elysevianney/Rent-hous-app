import 'package:location_app/export.dart';

class OtherUserProfil extends StatefulWidget {
  const OtherUserProfil({Key? key, required this.otherUserId}) : super(key: key);
  final String otherUserId;
  @override
  State<OtherUserProfil> createState() => _OtherUserProfilState(this.otherUserId);
}

class _OtherUserProfilState extends State<OtherUserProfil> {
  final String otherUserId;

  _OtherUserProfilState(this.otherUserId);
  @override
  Widget build(BuildContext context) {
    print(otherUserId);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            shape: const Border(bottom: BorderSide(color: AppColors.brown, width: 0.5)),
            leadingWidth: 38,
            centerTitle: false,
            toolbarHeight: 100,
            collapsedHeight: 100,
            surfaceTintColor: Colors.white,
            primary: false,
            leading: Container(
                padding: EdgeInsets.only(top: 30),
                child: IconButton(
                  onPressed: (){
                    context.pop();
                  },
                    icon: Icon(Icons.arrow_back_rounded, color: Colors.black,))),
            pinned: true,
            title: Container(
                padding: const EdgeInsets.only(top: 30),
                child:  Row(
                  children: [
                    Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          // border: Border.all(color: AppColors.brown, width: 1)
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset($AppAssets.imgs.maison, fit: BoxFit.cover,))),
                    const SizedBox(width: 12,),
                    Text('Annaelle',
                      style: AppTypography().title,),
                  ],
                )),
            expandedHeight: 280,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1,
              centerTitle: true,
              background: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 175,
                  child: Column(
                    children: [
                      Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            // border: Border.all(color: AppColors.brown, width: 1)
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset($AppAssets.imgs.maison, fit: BoxFit.cover,))),
                      const SizedBox(height: 12,),
                      Text('Annaelle', style: AppTypography().welcome.copyWith(color: AppColors.black2),),
                      //const SizedBox(height: 12,),
                      Text('+229 69479909', style: AppTypography().welcome.copyWith(color: AppColors.black2, fontSize: 14),),
                      const SizedBox(height: 12,),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0, top: 8),
                            child: Text('Annonces', style: AppTypography().title.copyWith(color: AppColors.primaryTwo),),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8,),
                      Divider(color: AppColors.brown.withOpacity(0.4), height: 1,),
                      const SizedBox(height: 12,),
                      //Container(height: 800,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 12),
                          itemBuilder: (BuildContext context, int index) {
                            return const OtherUserAnnonce();
                          },
                          itemCount: 10,
                        ),
                      ),
                    ],
                  )
                ]
            ),
          ),
        ],
      ),
    );
  }
}

class OtherUserAnnonce extends StatelessWidget {
  const OtherUserAnnonce({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            //width: 75,
            //height: 75,
          height: 100,
            decoration: BoxDecoration(
                color: AppColors.primaryTwo.withOpacity(0.4),
                borderRadius: BorderRadius.circular(12),
                //border: Border.all(color: AppColors.primaryTwo, width: 1)
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset($AppAssets.imgs.maison, fit: BoxFit.cover))
        ),
        const SizedBox(height: 8,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.location_pin, color: AppColors.primaryTwo, size: 18,),
            const SizedBox(width: 8,),
            Text('Cotonou,\nGbegamey',
              style: AppTypography().title,
            ),
          ],
        ),
      ],
    );
  }
}
