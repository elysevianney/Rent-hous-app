import 'package:location_app/export.dart';

class FormSbee extends StatefulWidget {
  const FormSbee({Key? key}) : super(key: key);

  @override
  State<FormSbee> createState() => _FormSbeeState();
}

class _FormSbeeState extends State<FormSbee> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  GlobalKey<FormState> infoFormKey = GlobalKey<FormState>();

  TextEditingController numroCompte = TextEditingController();
  TextEditingController montant = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.12),
                                blurRadius: 29,
                                spreadRadius: 6,
                                offset: const Offset(0, 0)
                            )
                          ]
                      ),
                      child: Center(
                        child: Image.asset(
                          $AppAssets.imgs.sbee,
                        ),
                      ),
                    ),),
                  ],
                ),
                const SizedBox(height: 33,),
                Form(
                  key: infoFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: numroCompte,
                          style: AppTypography()
                              .headline1
                              .copyWith(fontWeight: FontWeight.w400),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "N° du compteur",
                              label: Text(
                                "Entrer le N° de compte",
                                style: AppTypography()
                                    .headline1
                                    .copyWith(fontWeight: FontWeight.w400),
                              )),
                          onChanged: (value) {

                          },
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: montant,
                          style: AppTypography()
                              .headline1
                              .copyWith(fontWeight: FontWeight.w400),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Montant (FCFA)",
                              label: Text(
                                "Entrer le montant",
                                style: AppTypography()
                                    .headline1
                                    .copyWith(fontWeight: FontWeight.w400),
                              )),
                          onChanged: (value) {

                          },
                        ),
                        const SizedBox(height: 12),
                        AppButton(onTap: (){
                          context.push(AppPage.successPaiementSbee.toPath);
                        },
                          text: 'Payer',
                          textColor: AppColors.white,
                          backgroundColor: AppColors.primaryTwo,
                        )
                      ],
                    )
                )
              ],
            ),


          )
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Payer facture SBEE', style: AppTypography().medium.copyWith(
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
      ),
      drawer: MyDrawer(key2: _key,),
    );
  }
}
