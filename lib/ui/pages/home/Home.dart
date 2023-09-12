import 'dart:async';


import 'package:location_app/core/controllers/auth/post_controller.dart';
import 'package:location_app/export.dart';

import '../../../core/models/post.dart';
import '../../../core/provider/bottomNavigation/navigator_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override


  @override
  Widget build(BuildContext context) {
    DashboardProvider returnHome = Provider.of<DashboardProvider>(context);
    final post_controller = Provider.of<PostController>(context);



    return Scaffold(
      key: _key,
      drawer: MyDrawer(key2: _key,),
      body: NestedScrollView(
        //floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              snap: true,
              floating: true,
              backgroundColor: AppColors.primaryTwo,
              leading: InkWell(
                highlightColor: AppColors.primaryTwo,
                onTap: (){
                  _key.currentState?.openDrawer();
                  // Scaffold.of(context).openDrawer();
                },
                child: const Icon(
                    Icons.menu,
                    color: AppColors.white,
                    size: 25,
                  )
              ),
              actions:  [
                Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: //SvgPicture.asset($AppAssets.svgs.person_circle)
                  IconButton(
                      onPressed: (){
                        showSearch(context: context, delegate: MySearchDelegate());
                      },
                      icon: const Icon(Icons.search_rounded, color: AppColors.white, size: 25,)),
                )
              ],
            )
          ] ;
        },
        body:
        ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Découvrez les meilleurs\nappartements selon vos critères',
                    softWrap: true,
                    style: AppTypography().welcome2,
                  ),
                ),
                const SizedBox(height: 20,),
                FutureBuilder<List<Annonce>?>(
                  future: post_controller.getAnnonce(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Annonce>?> snapshot) {
                    print(post_controller.getAnnonce());
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data == null) {
                      return const Text('Aucun pack disponible');
                    } else {

                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          List<String> imgP = [];
                          for(int i = 0; i< snapshot.data!.elementAt(index).image.length; i++){

                            imgP.add(snapshot.data!.elementAt(index).image.elementAt(i).url);
                          }
                          Annonce element = snapshot.data!.elementAt(index);
                          return Annoncesss(
                              id: element.id,
                              username: '${snapshot.data!.elementAt(index).user.firstName} ${snapshot.data!.elementAt(0).user.lastName}',
                              imagePath: imgP,
                              price: element.prix, ville: element.ville,
                              quartier: element.quatier,
                              nbChambre: element.nbreChambre,
                              nbPersonne: element.nbrePersonne,
                              nbDouche: element.nbreDouche,
                              userProfilPath: $AppAssets.imgs.profil,

                          );
                        },
                      );
                    }
                  },
                ),



              ],
            )

          ],
        )
        /*ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Découvrez les meilleurs\nappartements selon vos critères',
                    softWrap: true,
                    style: AppTypography().welcome2,
                  ),
                ),
                const SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...allAnnonces
                  ],
                )



              ],
            )
          ],
        ),*/

      ),

    );
  }
}

class Annoncesss extends StatelessWidget {
  final String id;
  final String username;
  final String userProfilPath;
  final List<String> imagePath;
  final int price;
  final String ville;
  final String quartier;
  final int nbChambre;
  final int nbPersonne;
  final int nbDouche;
  const Annoncesss({
    super.key, required this.id, required this.username, required this.imagePath, required this.price, required this.ville, required this.quartier, required this.nbChambre, required this.nbPersonne, required this.nbDouche, required this.userProfilPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.brown, width: 1)
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(userProfilPath, fit: BoxFit.cover,))),
                  const SizedBox(width: 12,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 1.0),
                        child: Text(username,
                          style: AppTypography().title,
                        ),
                      ),
                      Text('2h',
                        style: AppTypography().subtitle,
                      ),

                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12,),
              GestureDetector(
                onTap: (){
                  context.push('${AppPage.detailPost.toPath}/$id');
                },
                child: ImageSlider(prix: '$price',
                  imagesPath: imagePath,
    /*imagesPath: [
                    $AppAssets.imgs.maison,
                    $AppAssets.imgs.maison,
                    $AppAssets.imgs.maison,
                  ],),*/
                )),
              const SizedBox(height: 12,),
              Row(
                children: [
                  const Icon(Icons.location_pin, color: AppColors.primaryTwo,),
                  const SizedBox(width: 8,),
                  Text('$ville, $quartier',
                    style: AppTypography().title,
                  ),
                ],
              ),
              const SizedBox(height: 12,),
              Row(
                children: [
                  HouseContent(imagePath: $AppAssets.svgs.friends, nber: nbPersonne,),
                  HouseContent(imagePath: $AppAssets.svgs.lit, nber: nbChambre,),
                  HouseContent(imagePath: $AppAssets.svgs.douche, nber: nbDouche,),
                ],
              ),
              const SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButton(onTap: () {

                    context.push('${AppPage.detailPost.toPath}/$username');

                  },
                    width: 61,
                    height: 35,
                    backgroundColor: AppColors.primaryTwo.withOpacity(0.2),
                    widget: Text('Details', style: AppTypography().regularAg12.copyWith(
                        color: AppColors.primaryTwo
                    ),),
                  ),
                  AppButton(onTap: () {

                  },
                    width: 90,
                    height: 35,
                    backgroundColor: AppColors.primaryTwo,
                    widget: Text('S\'interresser', style: AppTypography().regularAg12.copyWith(
                        color: AppColors.white
                    ),),
                  ),
                ],
              ),
              const SizedBox(height: 10,),


            ],
          ),

        ),
        Divider(thickness: 4, color: AppColors.hintColor.withOpacity(0.4),),
      ],
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return[IconButton(onPressed: (){

        query.isEmpty? close(context, null) : query ='';
      }, icon: const Icon(Icons.close,color: AppColors.white,))
    ];
    throw UnimplementedError();
  }


  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: (){
      close(context, null);
      }, icon: const Icon(Icons.arrow_back_rounded), color: AppColors.white,);
  }

  List<String> history=[];
  @override
  Widget buildResults(BuildContext context) {
    history.add(query);
    return Center(
      child: Text(query, style: AppTypography().title.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 25
      ),),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<Annoncesss> searchResults = [

      Annoncesss(username: 'Audrey LALI',
          imagePath: [$AppAssets.imgs.appart2_1,
            $AppAssets.imgs.appart2_2,
            $AppAssets.imgs.appart2_3,],
          price: 10000, ville: 'Calavi', quartier: 'Zogbadje', nbChambre: 1, nbPersonne: 1, nbDouche: 1, userProfilPath: $AppAssets.imgs.profil, id: '1',

      ),
      Annoncesss(username: 'Anaelle',
          imagePath: [$AppAssets.imgs.appart3_1,
            $AppAssets.imgs.appart3_2,
            $AppAssets.imgs.appart3_3,],
          price: 20000, ville: 'Porto-Novo', quartier: 'Agla', nbChambre: 2, nbPersonne: 4, nbDouche: 1, userProfilPath: $AppAssets.imgs.profil, id: '2',

      ),
      Annoncesss(username: 'Vianney AHM',
        imagePath: [$AppAssets.imgs.appart1_1,
          $AppAssets.imgs.appart1_2,
          $AppAssets.imgs.appart1_3,],
        price: 8500, ville: 'Cotonou', quartier: 'Agla', nbChambre: 2, nbPersonne: 4, nbDouche: 1, userProfilPath: $AppAssets.imgs.profil, id: '3',


      ),
      Annoncesss(username: 'Celsia',
          imagePath: [$AppAssets.imgs.maison,
            $AppAssets.imgs.maison,
            $AppAssets.imgs.maison,],
          price: 6500, ville: 'Calavi', quartier: 'Iita', nbChambre: 2, nbPersonne: 2, nbDouche: 1, userProfilPath: $AppAssets.imgs.profil, id: '4',

      ),
      Annoncesss(username: 'Fridaous H',
          imagePath: [$AppAssets.imgs.maison,
            $AppAssets.imgs.maison,
            $AppAssets.imgs.maison,],
          price: 8500, ville: 'Cotonou', quartier: 'Agla', nbChambre: 1, nbPersonne: 4, nbDouche: 1, userProfilPath: $AppAssets.imgs.profil, id: '5',

      ),
    ];
    List<Annoncesss> suggestions = searchResults.where((searchResult) {
      final result = searchResult.ville.toLowerCase() + searchResult.quartier.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
   
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index){
        final suggestion = suggestions[index];
        return

            InkWell(
              onTap: (){
                var username = suggestion.username;
                context.push('${AppPage.detailPost.toPath}/$username');
                /*query = suggestion;
                showResults(context);*/
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset($AppAssets.imgs.maison, fit: BoxFit.cover,))),
                    const SizedBox(width: 12,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_pin, color: AppColors.primaryTwo,),
                            const SizedBox(width: 10,),
                            Text(suggestion.ville+', '+suggestion.quartier,
                              style: AppTypography().title,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            SvgPicture.asset($AppAssets.svgs.price),
                            const SizedBox(width: 12,),
                            Text(suggestion.price.toString(),
                              style: AppTypography().title,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );

          /*ListTile(
          focusColor: AppColors.primaryTwo,
          title: Text(suggestion, style: AppTypography().title.copyWith(
            fontWeight: FontWeight.w400
          ),),
          onTap: (){
            query = suggestion;
            showResults(context);
          },
        );*/
      });
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      textTheme: const TextTheme(
        // Use this to change the query's text style
        titleLarge: TextStyle(fontSize: 16, color: AppColors.white),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryTwo,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        // Use this change the placeholder's text style
        hintStyle: TextStyle(fontSize: 16.0),
      ),
    );
  }
  @override
  String get searchFieldLabel => 'Entrer une ville ou quartier';
}
class ImageSlider extends StatefulWidget {
  final String prix;
  final List<String> imagesPath ;
   ImageSlider({Key? key, required this.prix, required this.imagesPath}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState(this.prix , this.imagesPath);
}

class _ImageSliderState extends State<ImageSlider> {
  final String prix;
  final List<String> imagesPath ;

  _ImageSliderState(this.prix, this.imagesPath);
  final List<NetworkImage> _pages = [
  ];


  final PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;
  @override
  void initState() {
    for(int i = 0; i < imagesPath.length; i++){
      _pages.add(
          NetworkImage(imagesPath.elementAt(i))
      );
    }


  }



  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.92,
              height: 260,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page){
                  setState(() {
                    _activePage = page;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    height: 260,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: _pages[index % _pages.length],
                            fit: BoxFit.cover)
                    ),
                    child: const SizedBox(),
                  );
                },
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8 ),
                decoration: const BoxDecoration(
                    color: AppColors.primaryTwo,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(6), bottomLeft: Radius.circular(6))
                ),
                child: Center(
                    child: Text('${prix}F',
                      style: AppTypography().title.copyWith(
                        fontSize: 14,
                        color: AppColors.white
                      ),
                    ),),
              )
          ),
          Positioned(
              bottom: 16,
              right: 16,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _pages.asMap().entries.map((entry) {
                      return GestureDetector(
                          onTap: () => _pageController.animateToPage(entry.key,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn
                          ),
                          child: Container(
                            width: _activePage == entry.key ?14.4 : 6,
                            height: 6,
                            margin: const EdgeInsets.symmetric(horizontal: 2.4),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                              color: _activePage == entry.key ? AppColors.primaryTwo : AppColors.white,
                            ),
                          ));
                    }).toList(),
                  ),
                ],
              )
          ),
        ]
    );
  }
}
class HouseContent extends StatelessWidget {
  final String imagePath;
  final int nber;
  const HouseContent({Key? key, required this.imagePath, required this.nber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 8),
          child: Center(child: SvgPicture.asset(imagePath,)),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text('$nber',
            style: AppTypography().subtitle
          ),
        ),
      ],
    );
  }
}
List<Annoncesss> allAnnonces = [


  Annoncesss(username: 'Audrey LALI',
    imagePath: [$AppAssets.imgs.appart2_1,
      $AppAssets.imgs.appart2_2,
      $AppAssets.imgs.appart2_3,],
    price: 1000, ville: 'Calavi', quartier: 'Zogbadje', nbChambre: 1, nbPersonne: 1, nbDouche: 1, userProfilPath: $AppAssets.imgs.profil, id: '1',

  ),
  Annoncesss(username: 'Anaelle',
      imagePath: [$AppAssets.imgs.appart3_1,
      $AppAssets.imgs.appart3_2,
      $AppAssets.imgs.appart3_3,],
    price: 20000, ville: 'Porto-Novo', quartier: 'Agla', nbChambre: 2, nbPersonne: 4, nbDouche: 1, userProfilPath: $AppAssets.imgs.profil, id: '2',

  ),
  Annoncesss(username: 'Vianney AHM',
    imagePath: [$AppAssets.imgs.appart1_1,
      $AppAssets.imgs.appart1_2,
      $AppAssets.imgs.appart1_3,],
    price: 8500, ville: 'Cotonou', quartier: 'Agla', nbChambre: 2, nbPersonne: 4, nbDouche: 1, userProfilPath: $AppAssets.imgs.profil, id: '3',


  ),
  Annoncesss(username: 'Celsia',
    imagePath: [$AppAssets.imgs.maison,
      $AppAssets.imgs.maison,
      $AppAssets.imgs.maison,],
    price: 6500, ville: 'Calavi', quartier: 'Iita', nbChambre: 2, nbPersonne: 2, nbDouche: 1, userProfilPath: $AppAssets.imgs.profil, id: '4',

  ),
  Annoncesss(username: 'Fridaous H',
    imagePath: [$AppAssets.imgs.maison,
      $AppAssets.imgs.maison,
      $AppAssets.imgs.maison,],
    price: 8500, ville: 'Cotonou', quartier: 'Agla', nbChambre: 1, nbPersonne: 4, nbDouche: 1, userProfilPath: $AppAssets.imgs.profil, id: '5',

  ),
];