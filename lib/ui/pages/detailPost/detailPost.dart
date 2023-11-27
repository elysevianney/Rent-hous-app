

import 'package:location_app/core/controllers/auth/post_controller.dart';
import 'package:location_app/export.dart';

import '../../../core/models/post.dart';

class DetatlPost extends StatefulWidget {
  const DetatlPost({Key? key, required this.username}) : super(key: key);
  final String username;

  @override
  State<DetatlPost> createState() => _DetatlPostState(this.username);
}

class _DetatlPostState extends State<DetatlPost> {
  _DetatlPostState(this.username);
  final String username;

  var _popupMenuItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    PostController postController = Provider.of<PostController>(context);

/*
    Iterable<Annoncess> annonce = allAnnonces.where((element) => element.username.compareTo(username) == 0);
    print(allAnnonces);
    print(annonce);
    Annoncess annonceDetails = annonce.elementAt(0);

    ///Others details
    bool sanitaire = annonceDetails.doucheSanitaire;
    bool wc = annonceDetails.wc;
    bool carreaux = annonceDetails.carreaux;
    bool electricite = annonceDetails.electricite;
    bool eau = annonceDetails.eau;*/

    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        child: AppButton(onTap: (){
          context.push('${AppPage.chatRoom.toPath}/$username');
        },
          text: 'ça m\'interresse',
          textColor: AppColors.white,
          backgroundColor: AppColors.primaryTwo ,
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
              title: Text('Annonce',
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
            ),
          ] ;
        },
        body: FutureBuilder<Annonce?>(
          future: postController.viewAnnonce(username),
          builder: (BuildContext context,
              AsyncSnapshot<Annonce?> snapshot) {
            print("akoba ${postController.viewAnnonce(username)}");

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Text('Aucun pack disponible');
            } else {
              Annonce? element = snapshot.data;
              List<String> imgP = [];
              for(int i = 0; i< element!.image.length; i++){

                imgP.add(element!.image.elementAt(i).url);
              }
              bool sanitaire = element!.sanitaire;
              bool carreaux =element!.carrele;
              bool electricite = element!.electricite;
              bool eau = element!.eau;
              return ListView(
                children:  [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Image.asset($AppAssets.imgs.profil),
                            const SizedBox(width: 12,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 1.0),
                                  child: Text('${element?.user.firstName} ${element?.user.lastName}',
                                    style: AppTypography().title,
                                  ),
                                ),
                                Text('${element?.createdAt.substring(0,10)}',
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
                            child: Stack(
                              children: [
                                ImageSlider(prix: element!.prix.toString(),
                                    imagesPath: imgP),
                                (element!.status == false) ?
                                Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8 ),
                                      decoration: const BoxDecoration(
                                          color: AppColors.primaryTwo,
                                          borderRadius: BorderRadius.only( bottomLeft: Radius.circular(12))
                                      ),
                                      child: Center(
                                        child: Text('Annonce prise',
                                          style: AppTypography().title.copyWith(
                                              fontSize: 12,
                                              color: AppColors.white
                                          ),
                                        ),),
                                    )
                                )
                                    :
                                SizedBox(),
                              ],
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
                                Text('${element!.ville}, ${element!.quatier}',
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
                                  child: Text(element!.prix.toString(),
                                      style: AppTypography().title.copyWith(fontSize: 16,color: AppColors.primaryTwo)
                                  ),
                                ),
                                Text('F/personne ',
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
                                HouseContentDetails(imagePath: $AppAssets.svgs.friends, nber: element!.nbrePersonne, element: 'personnes',),
                                const SizedBox(height: 12,),
                                HouseContentDetails(imagePath: $AppAssets.svgs.lit, nber: element!.nbreChambre, element: 'chambres',),
                                const SizedBox(height: 12,),
                                HouseContentDetails(imagePath: $AppAssets.svgs.douche, nber: element!.nbreDouche, element: 'douche',),
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
                        child: Text(
                          element!.description,
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
              );
            }
          },
        )
        /*,*/

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
                      image: DecorationImage(
                          image: _pages[index % _pages.length],
                          fit: BoxFit.cover)
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

class Annoncess extends StatelessWidget {
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
  final bool status;
  const Annoncess({
    super.key, required this.username, required this.imagePath, required this.price, required this.ville, required this.quartier, required this.nbChambre, required this.nbPersonne, required this.nbDouche, required this.userProfilPath, required this.description, required this.doucheSanitaire, required this.carreaux, required this.electricite, required this.eau, required this.wc, required this.status,
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
List<Annoncess> allAnnonces = [

  Annoncess(username: 'Vianney AHM',
      imagePath: [$AppAssets.imgs.maison,
        $AppAssets.imgs.maison,
        $AppAssets.imgs.maison,],
      price: 8500, ville: 'Cotonou', quartier: 'Agla', nbChambre: 2, nbPersonne: 4, nbDouche: 1, userProfilPath: $AppAssets.imgs.profil,
      description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard ezeezg Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum ha',
      doucheSanitaire: true,
      carreaux: true,
      eau:  true,
      electricite: true,
    wc: true, status: true,

  ),
  Annoncess(username: 'Audrey LALI',
      imagePath: [$AppAssets.imgs.appart2_1,
        $AppAssets.imgs.appart2_2,
        $AppAssets.imgs.appart2_3,],
      price: 10000, ville: 'Calavi', quartier: 'Zogbadje', nbChambre: 1, nbPersonne: 1, nbDouche: 1, userProfilPath: $AppAssets.imgs.profil
    ,description: 'Bonjour à tous. Je vous propose cet appartement  une chambre-salon qui est à Zogbagjè dèrrire l\'UAC. Ceci pourrait vraiment aider un étudiant. N\'hésitez pas à me contacter',
    doucheSanitaire: true,
    carreaux: true,
    eau:  true,
    electricite: true,
    wc: true, status: true,
  ),
  Annoncess(username: 'Anaelle',
      imagePath: [$AppAssets.imgs.maison,
        $AppAssets.imgs.maison,
        $AppAssets.imgs.maison,],
      price: 20000, ville: 'Porto-Novo', quartier: 'Agla', nbChambre: 2, nbPersonne: 4, nbDouche: 1, userProfilPath: $AppAssets.imgs.profil
    ,description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard ezeezg Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum ha',
    doucheSanitaire: true,
    carreaux: true,
    eau:  true,
    electricite: true,
    wc: true, status: true,
  ),
  Annoncess(username: 'Celsia',
      imagePath: [$AppAssets.imgs.maison,
        $AppAssets.imgs.maison,
        $AppAssets.imgs.maison,],
      price: 6500, ville: 'Calavi', quartier: 'Iita', nbChambre: 2, nbPersonne: 4, nbDouche: 1, userProfilPath: $AppAssets.imgs.profil
    ,description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard ezeezg Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum ha',
    doucheSanitaire: true,
    carreaux: true,
    eau:  true,
    electricite: true,
    wc: true, status: false,
  ),
  Annoncess(username: 'Vianney AHM',
      imagePath: [$AppAssets.imgs.maison,
        $AppAssets.imgs.maison,
        $AppAssets.imgs.maison,],
      price: 8500, ville: 'Cotonou', quartier: 'Agla', nbChambre: 2, nbPersonne: 4, nbDouche: 1, userProfilPath: $AppAssets.imgs.profil
    ,description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard ezeezg Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum ha',
    doucheSanitaire: true,
    carreaux: true,
    eau:  true,
    electricite: true,
    wc: true, status: true,
  ),
];