import 'package:location_app/export.dart';

class DetailPostOfUser extends StatefulWidget {
  const DetailPostOfUser({Key? key, required this.username}) : super(key: key);
  final String username;

  @override
  State<DetailPostOfUser> createState() => _DetailPostOfUserState(this.username);
}

class _DetailPostOfUserState extends State<DetailPostOfUser> {
  _DetailPostOfUserState(this.username);
  final String username;

  var _popupMenuItemIndex = 0;
  @override
  Widget build(BuildContext context) {

    Iterable<Annonce> annonce = allAnnoncesOfUser.where((element) => element.username.compareTo(username) == 0);
    print(allAnnonces);
    print(annonce);
    Annonce annonceDetails = annonce.elementAt(0);

    ///Others details
    bool sanitaire = annonceDetails.doucheSanitaire;
    bool wc = annonceDetails.wc;
    bool carreaux = annonceDetails.carreaux;
    bool electricite = annonceDetails.electricite;
    bool eau = annonceDetails.eau;

    var appBarHeight = AppBar().preferredSize.height;
    PopupMenuItem _buildPopupMenuItem(
        String title,  int position) {
      return PopupMenuItem(
        value: position,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(title),
          ],
        ),
      );
    }

    _onMenuItemSelected(int value) {
      setState(() {
        _popupMenuItemIndex = value;
      });

      if (value == 0) {
        //_changeColorAccordingToMenuItem = Colors.red;
      } else if (value == 1) {
        // _changeColorAccordingToMenuItem = Colors.green;
      }
    }

    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        child: AppButton(onTap: (){

        },
          text: 'ça m\'interresse',
          textColor: AppColors.white,
          backgroundColor: AppColors.primaryTwo,
        ),
      ),
      body: NestedScrollView(
        //floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              surfaceTintColor: AppColors.primaryTwo,
              pinned: true,
              backgroundColor: AppColors.primaryTwo,
              title: Text('Annonce de $username',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography().medium.copyWith(
                    fontSize: 16,
                    color: AppColors.white
                ),),
              shape: const Border(bottom: BorderSide(color: AppColors.brown, width: 0.5)),
              centerTitle: false,
              leading: IconButton(
                highlightColor: AppColors.white.withOpacity(0.4),
                onPressed: (){
                  context.pop();
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: AppColors.white,
                  size: 25,
                ),
              ),
              actions: [
                PopupMenuButton(
                  elevation: 3,
                  color: AppColors.white,
                  surfaceTintColor: AppColors.white,
                  onSelected: (value) {
                    _onMenuItemSelected(value as int);
                  },
                  offset: Offset(0.0, appBarHeight),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                  ),
                  itemBuilder: (ctx) => [
                    _buildPopupMenuItem('Modifier', 0),
                    _buildPopupMenuItem('Supprimer', 1),
                    _buildPopupMenuItem('Annonce prise', 2)

                  ],
                ),
              ],
            ),
          ] ;
        },
        body: ListView(
          children:  [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Image.asset(annonceDetails.userProfilPath),
                      const SizedBox(width: 12,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 1.0),
                            child: Text('$username',
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
                ),
                const SizedBox(height: 12,),
                Row(
                  children: [
                    Expanded(
                      child: Hero(
                        tag: 'ima',
                        child: ImageSlider(prix: annonceDetails.price.toString(),
                            imagesPath: annonceDetails.imagePath),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_pin, color: AppColors.primaryTwo, size: 18,),
                          const SizedBox(width: 8,),
                          Text('${annonceDetails.ville}, ${annonceDetails.quartier}',
                            style: AppTypography().title,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12,),
                      Row(
                        children: [
                          SvgPicture.asset($AppAssets.svgs.price, width: 15,),
                          Padding(
                            padding: const EdgeInsets.only(left:10, right: 8.0),
                            child: Text(annonceDetails.price.toString(),
                                style: AppTypography().title.copyWith(fontSize: 16,color: AppColors.primaryTwo)
                            ),
                          ),
                          Text('/personne ',
                              style: AppTypography().title.copyWith(fontSize: 16, color: AppColors.black2)
                          ),
                        ],
                      ),
                      const SizedBox(height: 12,),
                    ],
                  ),
                ),
                Divider(),
                const SizedBox(height: 12,),
                Padding(padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HouseContentDetails(imagePath: $AppAssets.svgs.friends, nber: annonceDetails.nbPersonne, element: 'personnes',),
                          const SizedBox(height: 12,),
                          HouseContentDetails(imagePath: $AppAssets.svgs.lit, nber: annonceDetails.nbChambre, element: 'chambres',),
                          const SizedBox(height: 12,),
                          HouseContentDetails(imagePath: $AppAssets.svgs.douche, nber: annonceDetails.nbDouche, element: 'douche',),
                        ],
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 12,),
                Divider(),
                const SizedBox(height: 12,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: electricite,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 14,
                                  height: 14,
                                  child:  Checkbox(
                                      checkColor: AppColors.white,
                                      activeColor: AppColors.primaryTwo,
                                      value: true,
                                      onChanged: (bool? value) {
                                      }
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Text('Electricité disponible',
                                  style: AppTypography().autreDetails.copyWith(
                                      color: AppColors.black2
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12,),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: eau,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 14,
                                  height: 14,
                                  child:  Checkbox(
                                      checkColor: AppColors.white,
                                      activeColor: AppColors.primaryTwo,
                                      value: true,
                                      onChanged: (bool? value) {
                                      }
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Text('Eau disponible',
                                  style: AppTypography().autreDetails.copyWith(
                                      color: AppColors.black2
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12,),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: sanitaire,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 14,
                                  height: 14,
                                  child:  Checkbox(
                                      checkColor: AppColors.white,
                                      activeColor: AppColors.primaryTwo,
                                      value: true,
                                      onChanged: (bool? value) {
                                      }
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Text('Douche sanitaire',
                                  style: AppTypography().autreDetails.copyWith(
                                      color: AppColors.black2
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12,),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: wc,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 14,
                                  height: 14,
                                  child:  Checkbox(
                                      checkColor: AppColors.white,
                                      activeColor: AppColors.primaryTwo,
                                      value: true,
                                      onChanged: (bool? value) {
                                      }
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Text('Toilettes disponibles',
                                  style: AppTypography().autreDetails.copyWith(
                                      color: AppColors.black2
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12,),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: carreaux,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 14,
                                  height: 14,
                                  child:  Checkbox(
                                      checkColor: AppColors.white,
                                      activeColor: AppColors.primaryTwo,
                                      value: true,
                                      onChanged: (bool? value) {
                                      }
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Text('Sol carrelé',
                                  style: AppTypography().autreDetails.copyWith(
                                      color: AppColors.black2
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                const SizedBox(height: 12,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard ezeezg Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum ha',
                    style: AppTypography().autreDetails.copyWith(
                        color: AppColors.black2,
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                const SizedBox(height: 12,),

              ],
            ),
          ],
        ),

      ),
    );
  }
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
  final List<AssetImage> _pages = [
  ];


  final PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;
  @override
  void initState() {
    for(int i = 0; i < imagesPath.length; i++){
      _pages.add(
          AssetImage(imagesPath.elementAt(i))
      );
    }

    /*if(_activePage == 0){
      Timer(Duration(seconds: 4), () {
        if(_pageController.hasClients) _pageController.animateToPage(1, duration: Duration(seconds: 1), curve: Curves.easeInOut);
      });
    }
    super.initState();*/
  }

  /*
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    for(int i = 0; i < _pages.length; i++){
      if(_activePage == _pages.length-1){
        Timer(Duration(seconds: 4), () {
          if(_pageController.hasClients) _pageController.jumpToPage(0);
        });
      }else{
        Timer(Duration(seconds: 4), () {
          if(_pageController.hasClients) _pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeInOut);

        });
      }
    }

  }*/

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
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
                      image: DecorationImage(image: _pages[index % _pages.length], fit: BoxFit.cover)
                  ),
                  child: const SizedBox(),
                );
              },
            ),
          ),
          const SizedBox(height: 12,),
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
                      color: _activePage == entry.key ? AppColors.primaryTwo :AppColors.primaryTwo.withOpacity(0.4) ,
                    ),
                  ));
            }).toList(),
          ),

        ]
    );
  }
}
class HouseContentDetails extends StatelessWidget {
  final String imagePath;
  final int nber;
  final String element;
  const HouseContentDetails({Key? key, required this.imagePath, required this.nber, required this.element}) : super(key: key);

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
            child: Text('$nber $element',
              style: AppTypography().autreDetails.copyWith(
                  color: AppColors.black2
              ),
            )),
      ],
    );
  }
}

class Annonce extends StatelessWidget {
  final String username;
  final String userProfilPath;
  final List<String> imagePath;
  final int price;
  final String ville;
  final String quartier;
  final int nbChambre;
  final int nbPersonne;
  final int nbDouche;
  final String description;
  final bool doucheSanitaire;
  final bool carreaux;
  final bool electricite;
  final bool eau;
  final bool wc;
  const Annonce({
    super.key, required this.username, required this.imagePath, required this.price, required this.ville, required this.quartier, required this.nbChambre, required this.nbPersonne, required this.nbDouche, required this.userProfilPath, required this.description, required this.doucheSanitaire, required this.carreaux, required this.electricite, required this.eau, required this.wc,
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
                    context.push('${AppPage.detailPost.toPath}/HELO tobi');
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
List<Annonce> allAnnoncesOfUser = [

  Annonce(username: 'Vianney AHM',
    imagePath: [$AppAssets.imgs.maison,
      $AppAssets.imgs.maison,
      $AppAssets.imgs.maison,],
    price: 8500, ville: 'Cotonou', quartier: 'Agla', nbChambre: 2, nbPersonne: 4, nbDouche: 1, userProfilPath: $AppAssets.imgs.profil,
    description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard ezeezg Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum ha',
    doucheSanitaire: true,
    carreaux: true,
    eau:  true,
    electricite: true,
    wc: true,

  ),
  Annonce(username: 'Audrey LALI',
    imagePath: [$AppAssets.imgs.maison,
      $AppAssets.imgs.maison,
      $AppAssets.imgs.maison,],
    price: 1000, ville: 'Calavi', quartier: 'Zogbadje', nbChambre: 2, nbPersonne: 23, nbDouche: 1, userProfilPath: $AppAssets.imgs.profil
    ,description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard ezeezg Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum ha',
    doucheSanitaire: true,
    carreaux: true,
    eau:  true,
    electricite: true,
    wc: true,
  ),
  Annonce(username: 'Anaelle',
    imagePath: [$AppAssets.imgs.maison,
      $AppAssets.imgs.maison,
      $AppAssets.imgs.maison,],
    price: 20000, ville: 'Porto-Novo', quartier: 'Agla', nbChambre: 2, nbPersonne: 4, nbDouche: 1, userProfilPath: $AppAssets.imgs.profil
    ,description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard ezeezg Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum ha',
    doucheSanitaire: true,
    carreaux: true,
    eau:  true,
    electricite: true,
    wc: true,
  ),
  Annonce(username: 'Celsia',
    imagePath: [$AppAssets.imgs.maison,
      $AppAssets.imgs.maison,
      $AppAssets.imgs.maison,],
    price: 6500, ville: 'Calavi', quartier: 'Iita', nbChambre: 2, nbPersonne: 4, nbDouche: 1, userProfilPath: $AppAssets.imgs.profil
    ,description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard ezeezg Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum ha',
    doucheSanitaire: true,
    carreaux: true,
    eau:  true,
    electricite: true,
    wc: true,
  ),
  Annonce(username: 'Vianney AHM',
    imagePath: [$AppAssets.imgs.maison,
      $AppAssets.imgs.maison,
      $AppAssets.imgs.maison,],
    price: 8500, ville: 'Cotonou', quartier: 'Agla', nbChambre: 2, nbPersonne: 4, nbDouche: 1, userProfilPath: $AppAssets.imgs.profil
    ,description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard ezeezg Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum ha',
    doucheSanitaire: true,
    carreaux: true,
    eau:  true,
    electricite: true,
    wc: true,
  ),
];