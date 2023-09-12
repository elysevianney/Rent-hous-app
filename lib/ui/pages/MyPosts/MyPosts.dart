import 'package:location_app/export.dart';

class MyPosts extends StatefulWidget {
  const MyPosts({Key? key}) : super(key: key);

  @override
  State<MyPosts> createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.primaryTwo,
        backgroundColor: AppColors.primaryTwo,
        title: Text('Mes annonces',
          style: AppTypography().medium.copyWith(
              fontSize: 16,
              color: AppColors.white
          ),),
       // shape: const Border(bottom: BorderSide(color: AppColors.brown, width: 0.5)),
        centerTitle: false,
        leading: IconButton(
          highlightColor: AppColors.white.withOpacity(0.3),
          onPressed: (){
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: AppColors.white,
            size: 20,
          ),
        ),
        actions: [

        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child:  ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
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
              ),
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
            child: InkWell(
              onTap: (){
                context.push('${AppPage.detailPostOfUser.toPath}/Vianney AHM');
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset($AppAssets.imgs.maison, fit: BoxFit.cover)),
            )
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