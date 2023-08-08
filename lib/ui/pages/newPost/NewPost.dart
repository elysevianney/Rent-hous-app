
import 'dart:io';
import 'dart:async';
import 'package:location_app/export.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/provider/bottomNavigation/navigator_provider.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {

  //FORM CONTROLLER
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
  void selctImage() async {
    final List<XFile>? selectedImage = await myImagePicker.pickMultiImage();
    if(selectedImage!.isNotEmpty){
      imagePickedList!.addAll(selectedImage);
    }
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    DashboardProvider returnHome = Provider.of<DashboardProvider>(context);
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
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      sanitaire? sanitaire = false : sanitaire = true;
                                    });
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