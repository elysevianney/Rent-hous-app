
import 'dart:io';
import 'dart:async';
import 'package:location_app/core/controllers/auth/post_controller.dart';
import 'package:location_app/core/models/payloads/createPost_request.dart';
import 'package:location_app/core/provider/validator/create_post_provider.dart';
import 'package:location_app/export.dart';

import '../../../core/provider/bottomNavigation/navigator_provider.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {

  //FORM CONTROLLER
  GlobalKey<FormState> infoFormKey = GlobalKey<FormState>();

  TextEditingController villeController = TextEditingController();
  TextEditingController quartierController = TextEditingController();
  TextEditingController nbrChambre = TextEditingController();
  TextEditingController nbrDouche = TextEditingController();
  TextEditingController nbrPersonne = TextEditingController();
  TextEditingController prix = TextEditingController();
  TextEditingController description = TextEditingController();
  bool sanitaire = false;
  bool wc = false;
  bool carreaux = false;
  bool electricite = false;
  bool eau = false;

  //Image picker
  final ImagePicker myImagePicker = ImagePicker();
  List<XFile> imagePickedList = [];


  @override
  Widget build(BuildContext context) {



    final provider = Provider.of<PostValidator>(context);
    final postController = Provider.of<PostController>(context);
    DashboardProvider returnHome = Provider.of<DashboardProvider>(context);

    void selctImage() async {
      final List<XFile>? selectedImage = await myImagePicker.pickMultiImage();
      if(selectedImage!.isNotEmpty){
        imagePickedList!.addAll(selectedImage);
      }
      setState(() {

      });
      provider.setzeroPickedList();
      for(int i =0;  i < imagePickedList.length; i++){
        provider.setimagePickedList(imagePickedList.elementAt(i));
      }
    }

    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
              title: Text('Nouveau Post', style: AppTypography().medium.copyWith(
                  fontSize: 16,
                  color: AppColors.primaryTwo
              ),),
              shape: const Border(bottom: BorderSide(color: AppColors.brown, width: 0.5)),
              centerTitle: false,
              leading: InkWell(
                highlightColor: AppColors.primaryTwo,
                onTap: (){
                  returnHome.setIndex(0);
                  returnHome.setIsReturn(true);
                  returnHome.setEtat(0);
                },
                child: const Icon(
                  Icons.arrow_back_rounded,
                  color: AppColors.black2,
                  size: 25,
                ),
              ),

            ),
          ] ;
        },
        body: ListView(
          children:  [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: infoFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                              color: AppColors.primaryTwo.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.primaryTwo, width: 1)
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_circle, color: AppColors.black2,  size: 16,),
                                  SizedBox(height: 2,),
                                  Text('Ajouter\ndes images',
                                    textAlign: TextAlign.center,
                                    style: AppTypography().itemLabel.copyWith(
                                      fontSize: 8,
                                      color: AppColors.black2
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: (){
                            selctImage();

                          },
                        ),
                        const SizedBox(width: 6,),
                        Expanded(child: Container(
                          height: 76,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                              itemCount: imagePickedList.length,
                              itemBuilder: (BuildContext context, int index){
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                          width: 75,
                                          height: 75,
                                          decoration: BoxDecoration(
                                              color: AppColors.primaryTwo.withOpacity(0.4),
                                              borderRadius: BorderRadius.circular(12),
                                              border: Border.all(color: AppColors.primaryTwo, width: 1)
                                          ),
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(12),
                                              child: Image.file(File(imagePickedList[index].path), fit: BoxFit.cover,))
                                      ),
                                      Positioned(
                                        top: 4,
                                        right: 4,
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              color: AppColors.black2.withOpacity(0.4),
                                              borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: IconButton(onPressed: (){
                                              imagePickedList.removeAt(index);
                                              provider.removeimagePickedList(imagePickedList.elementAt(index));
                                              setState(() {

                                              });
                                              },
                                              padding: EdgeInsets.zero,
                                              icon: Icon(Icons.close, color: AppColors.white,  size: 14,),) //
                                          ),
                                        ),)
                                    ],
                                  ),
                                )
                                  ;
                              })
                          ),
                        )],
                    ),
                    const SizedBox(height: 12,),
                    Row(
                      children: [
                        const Icon(Icons.location_pin, size: 20, color: AppColors.primaryTwo,),
                        const SizedBox(width: 12,),
                        Text('Emplacement de l\'appartement',
                          style: AppTypography().formTitle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12,),
                    TextFormField(
                      controller: villeController,
                      style: AppTypography()
                          .headline1
                          .copyWith(fontWeight: FontWeight.w400),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: AppColors.red),
                          border: const OutlineInputBorder(),
                          hintText: "Entrer la ville",
                          label: Text(
                            "Ville",
                            style: AppTypography()
                                .headline1
                                .copyWith(fontWeight: FontWeight.w400),
                          )),
                      onChanged: (value) {
                        provider.setVille(value);
                      },
                      validator: (value){
                        if(value!.isEmpty){
                        return provider.validateVille(ville: value);}
                      }
                    ),
                    const SizedBox(height: 12,),
                    TextFormField(
                      controller: quartierController,
                      style: AppTypography()
                          .headline1
                          .copyWith(fontWeight: FontWeight.w400),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Entrer le quartier",
                          label: Text(
                            "Quartier",
                            style: AppTypography()
                                .headline1
                                .copyWith(fontWeight: FontWeight.w400),
                          )),
                        onChanged: (value) {
                          provider.setQuartier(value);
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return provider.validateQuartier(quartier: value);}
                        }
                    ),
                    const SizedBox(height: 16,),
                    Divider(thickness: 1, color: AppColors.hintColor.withOpacity(0.4)),
                    const SizedBox(height: 12,),
                    Row(
                      children: [
                        const Icon(Icons.home_rounded, size: 20, color: AppColors.primaryTwo,),
                        const SizedBox(width: 12,),
                        Text('Logement',
                          style: AppTypography().formTitle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12,),
                    TextFormField(
                      controller: nbrPersonne,
                      style: AppTypography()
                          .headline1
                          .copyWith(fontWeight: FontWeight.w400),
                      keyboardType: TextInputType.number,
                      //maxLength: 2,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Entrer le nombre de personnes",
                          label: Text(
                            "Nombre de personnes",
                            style: AppTypography()
                                .headline1
                                .copyWith(fontWeight: FontWeight.w400),
                          )),
                        onChanged: (value) {
                          provider.setNbrPersonnes(value);
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return provider.validateNbrPersonnes(nbrPersonnes: value);}
                        }
                    ),
                    const SizedBox(height: 12,),
                    TextFormField(
                      controller: nbrChambre,
                      style: AppTypography()
                          .headline1
                          .copyWith(fontWeight: FontWeight.w400),
                      keyboardType: TextInputType.number,
                      //maxLength: 2,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Entrer le nombre de chambres",
                          label: Text(
                            "Nombre de chambres",
                            style: AppTypography()
                                .headline1
                                .copyWith(fontWeight: FontWeight.w400),
                          )),
                        onChanged: (value) {
                          provider.setNbrChambres(value);
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return provider.validateNbrChambres(nbrChambres: value);}
                        }
                    ),
                    const SizedBox(height: 12,),
                    TextFormField(
                      controller: nbrDouche,
                      style: AppTypography()
                          .headline1
                          .copyWith(fontWeight: FontWeight.w400),
                      keyboardType: TextInputType.number,
                      //maxLength: 2,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Entrer le nombre de douches",
                          label: Text(
                            "Nombre de douches",
                            style: AppTypography()
                                .headline1
                                .copyWith(fontWeight: FontWeight.w400),
                          )),
                        onChanged: (value) {
                          provider.setNbrDouche(value);
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return provider.validateNbrDouches(nbrDouches: value);}
                        }
                    ),
                    const SizedBox(height: 16,),
                    Row(
                      children: [
                        SvgPicture.asset($AppAssets.svgs.price),
                        const SizedBox(width: 12,),
                        Text('Prix',
                          style: AppTypography().formTitle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16,),
                    Divider(thickness: 1, color: AppColors.hintColor.withOpacity(0.4)),
                    const SizedBox(height: 12,),
                    TextFormField(
                      controller: prix,
                      style: AppTypography()
                          .headline1
                          .copyWith(fontWeight: FontWeight.w400),
                      keyboardType: TextInputType.number,
                      //maxLength: 2,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Entrer le prix par personne",
                          label: Text(
                            "Prix par personne",
                            style: AppTypography()
                                .headline1
                                .copyWith(fontWeight: FontWeight.w400),
                          )),
                        onChanged: (value) {
                          provider.setPrix(value);
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return provider.validatePrix(prix: value);}
                        }
                    ),
                    const SizedBox(height: 16,),
                    Divider(thickness: 1, color: AppColors.hintColor.withOpacity(0.4)),
                    const SizedBox(height: 12,),
                    Row(
                      children: [
                        const Icon(Icons.home_rounded, size: 20, color: AppColors.primaryTwo,),
                        const SizedBox(width: 12,),
                        Text('Autres détails',
                          style: AppTypography().formTitle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      sanitaire? sanitaire = false : sanitaire = true;
                                    });
                                    provider.setSanitaire(sanitaire);
                                    print(provider.sanitaire);
                                  },
                                  highlightColor: Colors.transparent,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 14,
                                        width: 14,
                                        child:  Checkbox(
                                            checkColor: AppColors.white,
                                            activeColor: AppColors.primaryTwo,
                                            value: sanitaire,
                                            onChanged: (bool? value) {

                                              setState(() {
                                                sanitaire = value!;
                                              });

                                            }
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                      Text('Douche sanitaire',
                                        style: AppTypography().autreDetails.copyWith(
                                            color: sanitaire ==true ? AppColors.primaryTwo : AppColors.black2
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12,),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      electricite? electricite = false : electricite = true;
                                    });
                                    provider.setElectricite(electricite);
                                  },
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 14,
                                        width: 14,
                                        child:  Checkbox(
                                            checkColor: AppColors.white,
                                            activeColor: AppColors.primaryTwo,
                                            value: electricite,
                                            onChanged: (bool? value) {

                                              setState(() {
                                                electricite = value!;
                                              });

                                            }
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                      Text('Electricité',
                                        style: AppTypography().autreDetails.copyWith(
                                            color: electricite ==true ? AppColors.primaryTwo : AppColors.black2
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12,),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      wc? wc = false : wc = true;
                                    });
                                    provider.setWc(wc);
                                  },
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 14,
                                        height: 14,
                                        child:  Checkbox(
                                            checkColor: AppColors.white,
                                            activeColor: AppColors.primaryTwo,
                                            value: wc,
                                            onChanged: (bool? value) {

                                              setState(() {
                                                wc = value!;
                                              });

                                            }
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                      Text('WC',
                                        style: AppTypography().autreDetails.copyWith(
                                            color: wc ==true ? AppColors.primaryTwo : AppColors.black2
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      carreaux? carreaux = false : carreaux = true;
                                    });
                                    provider.setCarreaux(carreaux);
                                  },
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 14,
                                        height: 14,
                                        child:  Checkbox(
                                            checkColor: AppColors.white,
                                            activeColor: AppColors.primaryTwo,
                                            value: carreaux,
                                            onChanged: (bool? value) {

                                              setState(() {
                                                carreaux = value!;
                                              });

                                            }
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                      Text('Sol carrelé',
                                        style: AppTypography().autreDetails.copyWith(
                                            color: carreaux ==true ? AppColors.primaryTwo : AppColors.black2
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12,),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      eau? eau = false : eau = true;
                                    });
                                    provider.setEau(eau);
                                  },
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 14,
                                        height: 14,
                                        child:  Checkbox(
                                            checkColor: AppColors.white,
                                            activeColor: AppColors.primaryTwo,
                                            value: eau,
                                            onChanged: (bool? value) {

                                              setState(() {
                                                eau = value!;
                                              });
                                            }
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                      Text('Eau',
                                        style: AppTypography().autreDetails.copyWith(
                                            color: eau ==true ? AppColors.primaryTwo : AppColors.black2
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      controller: description,
                      style: AppTypography()
                          .headline1
                          .copyWith(fontWeight: FontWeight.w400),
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Enter une description",
                          label: Text(
                            "Description",
                            style: AppTypography()
                                .headline1
                                .copyWith(fontWeight: FontWeight.w400),
                          )),
                        onChanged: (value) {
                          provider.setDescription(value);
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return provider.validateDescription(description: value);}
                        }
                    ),
                    const SizedBox(height: 16,),
                    Consumer<PostController>(builder: (context, postProvider, child) {
                      return Column(
                        children: [
                          AppButton(
                            onTap: () async{

                            print(infoFormKey.currentState!.validate() == true && provider.isValid);print('cc');
                            if(infoFormKey.currentState!.validate() == true && provider.isValid){

                              //() async {
                                {
                                print('cc2');
                                print(provider.imagePickedList.length);
                                List<ImageA> imgP =[];
                                for(int i = 0; i< provider.imagePickedList.length; i++){

                                  imgP.add(ImageA(
                                      id: '',
                                      originalName: provider.imagePickedList.elementAt(i).path,
                                      type: provider.imagePickedList.elementAt(i).mimeType.toString(),
                                      url:  provider.imagePickedList.elementAt(i).path,
                                      updatedAt: '',
                                      createdAt: ''));
                                }
                                  CreatePostRequest payload = CreatePostRequest(
                                   id: '',
                                  image: provider.imagePickedList,
                                  user: '',
                                  ville: provider.ville,
                                  quatier: provider.quartier,
                                  prix: provider.prix,
                                  nbreDouche: provider.nbrDouches,
                                  nbreChambre: provider.nbrPersonnes,
                                  nbrePersonne: provider.nbrPersonnes,
                                  description: provider.description,
                                  date: '',
                                  sanitaire: provider.sanitaire,
                                  electricite : provider.electricite,
                                  eau: provider.eau,
                                  carrele: provider.carreaux,
                                  status: true,
                                  deleted: false,
                                  updatedAt: '',
                                  createdAt: ''
                                  );


                                  print(payload.toString());
                                  bool? success =
                                      await postProvider.createPost(payload);
                                print(success);

                                  if (success == true) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Post créé avec succès',
                                          style: AppTypography().authText.copyWith(
                                              color: AppColors.white
                                          ),
                                        ),
                                        backgroundColor: Colors.green.shade300,
                                      ),
                                    );
                                    villeController.clear();
                                    returnHome.setEtat(0);
                                    returnHome.setIndex(0);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          postController.errorMessage,
                                          style: AppTypography().authText,
                                        ),
                                        backgroundColor: Colors.red.shade300,
                                      ),
                                    );
                                  }

                              };

                              }
                            },

                            widget: postProvider.requestLoading
                            ? const CircularProgressIndicator(
                             color: Colors.white,
                            )
                            : Text('Publier',
                              style: AppTypography().buttonText.copyWith(color: AppColors.white),
                              textAlign: TextAlign.center,),

                            backgroundColor: AppColors.primaryTwo,
                          ),
                        ]

                      );
                      }),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
            )
          ],
        ),

      ),

    );
  }
}


/*

class ImageSelected extends StatelessWidget {
  final XFile imagepath;
  const ImageSelected({Key? key, required this.imagepath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
              color: AppColors.primaryTwo.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.primaryTwo, width: 1)
          ),
          child: Image.file(File(imagepath), fit: BoxFit.cover,)
        )
      ],
    );
  }
}


      body: ListView(
        children:  [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                      const Icon(Icons.location_pin, size: 20, color: AppColors.primaryTwo,),
                      const SizedBox(width: 12,),
                      Text('Emplacement de l\'apparetement',
                        style: AppTypography().formTitle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  TextFormField(
                    controller: villeController,
                    style: AppTypography()
                        .headline1
                        .copyWith(fontWeight: FontWeight.w400),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Entrer la ville",
                        label: Text(
                          "Ville",
                          style: AppTypography()
                              .headline1
                              .copyWith(fontWeight: FontWeight.w400),
                        )),
                    onChanged: (value) {

                    },
                  ),
                  const SizedBox(height: 12,),
                  TextFormField(
                    controller: quartierController,
                    style: AppTypography()
                        .headline1
                        .copyWith(fontWeight: FontWeight.w400),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Entrer le quartier",
                        label: Text(
                          "Quartier",
                          style: AppTypography()
                              .headline1
                              .copyWith(fontWeight: FontWeight.w400),
                        )),
                    onChanged: (value) {

                    },
                  ),
                  const SizedBox(height: 16,),
                  Divider(thickness: 1, color: AppColors.hintColor.withOpacity(0.4)),
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                      const Icon(Icons.home_rounded, size: 20, color: AppColors.primaryTwo,),
                      const SizedBox(width: 12,),
                      Text('Logement',
                        style: AppTypography().formTitle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  TextFormField(
                    controller: nbrPersonne,
                    style: AppTypography()
                        .headline1
                        .copyWith(fontWeight: FontWeight.w400),
                    keyboardType: TextInputType.number,
                    //maxLength: 2,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Entrer le nombre de personnes",
                        label: Text(
                          "Nombre de personnes",
                          style: AppTypography()
                              .headline1
                              .copyWith(fontWeight: FontWeight.w400),
                        )),
                    onChanged: (value) {

                    },
                  ),
                  const SizedBox(height: 12,),
                  TextFormField(
                    controller: nbrChambre,
                    style: AppTypography()
                        .headline1
                        .copyWith(fontWeight: FontWeight.w400),
                    keyboardType: TextInputType.number,
                    //maxLength: 2,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Entrer le nombre de chambres",
                        label: Text(
                          "Nombre de chambres",
                          style: AppTypography()
                              .headline1
                              .copyWith(fontWeight: FontWeight.w400),
                        )),
                    onChanged: (value) {

                    },
                  ),
                  const SizedBox(height: 12,),
                  TextFormField(
                    controller: nbrDouche,
                    style: AppTypography()
                        .headline1
                        .copyWith(fontWeight: FontWeight.w400),
                    keyboardType: TextInputType.number,
                    //maxLength: 2,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Entrer le nombre de douches",
                        label: Text(
                          "Nombre de douches",
                          style: AppTypography()
                              .headline1
                              .copyWith(fontWeight: FontWeight.w400),
                        )),
                    onChanged: (value) {

                    },
                  ),
                  const SizedBox(height: 16,),
                  Row(
                    children: [
                      SvgPicture.asset($AppAssets.svgs.price),
                      const SizedBox(width: 12,),
                      Text('Price',
                        style: AppTypography().formTitle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16,),
                  Divider(thickness: 1, color: AppColors.hintColor.withOpacity(0.4)),
                  const SizedBox(height: 12,),
                  TextFormField(
                    controller: prix,
                    style: AppTypography()
                        .headline1
                        .copyWith(fontWeight: FontWeight.w400),
                    keyboardType: TextInputType.number,
                    //maxLength: 2,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Entrer le prix par personne",
                        label: Text(
                          "Prix par personne",
                          style: AppTypography()
                              .headline1
                              .copyWith(fontWeight: FontWeight.w400),
                        )),
                    onChanged: (value) {

                    },
                  ),
                  const SizedBox(height: 16,),
                  Divider(thickness: 1, color: AppColors.hintColor.withOpacity(0.4)),
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                      const Icon(Icons.home_rounded, size: 20, color: AppColors.primaryTwo,),
                      const SizedBox(width: 12,),
                      Text('Autres détails',
                        style: AppTypography().formTitle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 14,
                                  width: 14,
                                  child:  Checkbox(
                                      checkColor: AppColors.white,
                                      activeColor: AppColors.primaryTwo,
                                      value: sanitaire,
                                      onChanged: (bool? value) {

                                        setState(() {
                                          sanitaire = value!;
                                        });
                                      }
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Text('Douche sanitaire',
                                  style: AppTypography().autreDetails.copyWith(
                                    color: sanitaire ==true ? AppColors.primaryTwo : AppColors.black2
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12,),
                            Row(
                              children: [
                                SizedBox(
                                  height: 14,
                                  width: 14,
                                  child:  Checkbox(
                                      checkColor: AppColors.white,
                                      activeColor: AppColors.primaryTwo,
                                      value: electricite,
                                      onChanged: (bool? value) {

                                        setState(() {
                                          electricite = value!;
                                        });
                                      }
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Text('Electricité',
                                  style: AppTypography().autreDetails.copyWith(
                                      color: electricite ==true ? AppColors.primaryTwo : AppColors.black2
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12,),
                            Row(
                              children: [
                                SizedBox(
                                  width: 14,
                                  height: 14,
                                  child:  Checkbox(
                                      checkColor: AppColors.white,
                                      activeColor: AppColors.primaryTwo,
                                      value: wc,
                                      onChanged: (bool? value) {

                                        setState(() {
                                          wc = value!;
                                        });
                                      }
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Text('WC',
                                  style: AppTypography().autreDetails.copyWith(
                                      color: wc ==true ? AppColors.primaryTwo : AppColors.black2
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                      Expanded(
                        flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 14,
                                    height: 14,
                                    child:  Checkbox(
                                        checkColor: AppColors.white,
                                        activeColor: AppColors.primaryTwo,
                                        value: carreaux,
                                        onChanged: (bool? value) {

                                          setState(() {
                                            carreaux = value!;
                                          });
                                        }
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Text('Sol carrelé',
                                    style: AppTypography().autreDetails.copyWith(
                                        color: carreaux ==true ? AppColors.primaryTwo : AppColors.black2
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12,),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 14,
                                    height: 14,
                                    child:  Checkbox(
                                        checkColor: AppColors.white,
                                        activeColor: AppColors.primaryTwo,
                                        value: eau,
                                        onChanged: (bool? value) {

                                          setState(() {
                                            eau = value!;
                                          });
                                        }
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Text('Eau',
                                    style: AppTypography().autreDetails.copyWith(
                                        color: eau ==true ? AppColors.primaryTwo : AppColors.black2
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                  const SizedBox(height: 16,),
                  TextFormField(
                    controller: description,
                    style: AppTypography()
                        .headline1
                        .copyWith(fontWeight: FontWeight.w400),
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: "Enter une description",
                        label: Text(
                          "Description",
                          style: AppTypography()
                              .headline1
                              .copyWith(fontWeight: FontWeight.w400),
                        )),
                    onChanged: (value) {

                    },
                  ),
                  const SizedBox(height: 16,),
                  AppButton(onTap: (){
                    context.push(AppPage.successPaiementSbee.toPath);
                  },
                    text: 'Publier',
                    textColor: AppColors.white,
                    backgroundColor: AppColors.primaryTwo,
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          )
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Nouveau Post', style: AppTypography().medium.copyWith(
            fontSize: 16,
            color: AppColors.primaryTwo
        ),),
        centerTitle: false,
        leading: InkWell(
          highlightColor: AppColors.primaryTwo,
          onTap: (){
            returnHome.setIndex(0);
            returnHome.setIsReturn(true);
            returnHome.setEtat(0);
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: AppColors.black2,
            size: 25,
          ),
        ),

      ),*/