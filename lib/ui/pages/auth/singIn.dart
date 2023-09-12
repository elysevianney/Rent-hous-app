import 'package:flutter/services.dart';
import 'package:location_app/export.dart';
import 'package:location_app/ui/pages/auth/widget/sign_template.dart';

import '../../../core/controllers/auth/auth_controller.dart';
import '../../../core/models/payloads/register_request.dart';
import '../../../core/provider/validator/inscription_provider.dart';
import '../../../ressources/theme/color/app_color.dart';
import '../../../utils_/constants/space.dart';
import '../../common/app_inkwell.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String lastnameError = '';
  String firstnameError = '';
  String emailError = '';
  String passwordError = '';
  String confirmPasswordError = '';
  bool formIsValid(){
    if(lastnameError.isEmpty && firstnameError.isEmpty && emailError.isEmpty && passwordError.isEmpty && confirmPasswordError.isEmpty){
      return true;
    }else{
      return false;
    }
  }

  GlobalKey<FormState> infoFormKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController tel = TextEditingController();
  bool _obscureText = false;
  bool _obscureTextCorrect = false;
  bool checkedValue = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ValidatorProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.primaryTwo,
      appBar: AppBar(
        elevation: 0.0,
        leading: const Icon(
          Icons.chevron_left,
          color: Colors.white,
        ),
        title: const Text(
          'S\'inscrire',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryTwo,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,

        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: infoFormKey,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24,),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 22,),
                  Text(
                    'Créer un nouveau compte',
                    style: AppTypography().medium.copyWith(
                        color: AppColors.primaryTwo, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 54.h,),
                  Center(child: SvgPicture.asset($AppAssets.svgs.image_inscription)),
                  SizedBox(height: 12,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 0.8,
                                    blurRadius: 20)
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 18, right: 10),
                                child: const Icon(Icons.person,
                                  size: 30,
                                  color: AppColors.primaryTwo,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: TextFormField(
                                    controller: lastNameController,
                                    style: AppTypography()
                                        .headline1
                                        .copyWith(fontWeight: FontWeight.w400),
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: "Nom",
                                        label: Text(
                                          "Nom",
                                          style: AppTypography()
                                              .headline1
                                              .copyWith(fontWeight: FontWeight.w400),
                                        )),
                                    onChanged: (value) {
                                      provider.getLastName(value);
                                      provider.onchangeController(value, lastNameController);
                                    },
                                    validator: (value) {
                                      provider.validateLastName(userLastname: lastNameController.text) != ''?
                                      setState(() {
                                        lastnameError = provider.validateLastName(userLastname:lastNameController.text)!;
                                      })
                                      : setState(() {
                                        lastnameError = '';
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  InputError(text: lastnameError,),
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(Radius.circular(30)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 0.8,
                                    blurRadius: 20)
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 18, right: 10),
                                child: const Icon(Icons.person,
                                  size: 30,
                                  color: AppColors.primaryTwo,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: TextFormField(

                                    controller: firstNameController,
                                    style: AppTypography()
                                        .headline1
                                        .copyWith(fontWeight: FontWeight.w400),
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: "Prénom",
                                        label: Text(
                                          "Prénom",
                                          style: AppTypography()
                                              .headline1
                                              .copyWith(fontWeight: FontWeight.w400),
                                        )),
                                    validator: (value) {
                                      provider.validateFirstName(userFirstName: firstNameController.text) != ''?
                                      setState(() {
                                        firstnameError = provider.validateFirstName(userFirstName: firstNameController.text)!;
                                      })
                                          : setState(() {
                                        firstnameError = '';
                                      });
                                    },
                                    onChanged: (value) {
                                      provider.getFirstname(value);
                                       provider.onchangeController(value,firstNameController);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  InputError(text: firstnameError,),

                  Visibility(
                    visible: firstnameError == ''? false: true ,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 40,),
                            child: Text(firstnameError,
                              softWrap: true,
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 10
                              ),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12,),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(Radius.circular(30)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 0.8,
                                    blurRadius: 20)
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 18, right: 10),
                                child: const Icon(Icons.person,
                                  size: 30,
                                  color: AppColors.primaryTwo,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: IntlPhoneField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                    ],
                                    disableLengthCheck: true,
                                    flagsButtonPadding: const EdgeInsets.only(left: 16),
                                    pickerDialogStyle: PickerDialogStyle(
                                      backgroundColor: AppColors.white,
                                      countryNameStyle: AppTypography().authText,
                                      countryCodeStyle: AppTypography().authText,
                                    ),
                                    invalidNumberMessage: "Numéro de téléphone incorrect",
                                    controller: tel,
                                    searchText: "Rechercher votre pays",
                                    style: AppTypography()
                                        .headline1
                                        .copyWith(fontWeight: FontWeight.w400),
                                    decoration: InputDecoration(
                                        errorBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        hintText: "Téléphone",
                                        hintStyle: AppTypography()
                                            .headline1
                                            .copyWith(color: AppColors.hintColor, fontSize: 14.h),
                                        label: Text(
                                          "Téléphone",
                                          style: AppTypography().headline1.copyWith(
                                              fontWeight: FontWeight.w400, fontSize: 14.h),
                                        )),
                                    initialCountryCode: 'BJ',
                                    validator: (phone) {
                                      provider.validatePhone(phoneNumber: phone?.number);
                                      provider.getDialCode(phone?.countryCode ?? "");
                                      provider.getTel(phone?.number ?? "");
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Consumer<AuthController>(builder: (context, authProvider, child) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 0.8,
                                          blurRadius: 20)
                                    ]),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 18, right: 10),
                                      child: const Icon(Icons.mail,
                                        size: 30,
                                        color: AppColors.primaryTwo,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.only(right: 20),
                                        child: TextFormField(
                                          controller: email,
                                          style: AppTypography()
                                              .headline1
                                              .copyWith(fontWeight: FontWeight.w400),
                                          keyboardType: TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              hintText: "E-mail",
                                              label: Text(
                                                "E-mail",
                                                style: AppTypography()
                                                    .headline1
                                                    .copyWith(fontWeight: FontWeight.w400),
                                              )),
                                          onChanged: (value) {
                                             provider.getEmail(value);

                                          },
                                          validator: (value) {
                                            provider.validateEmail(email: email.text).toString() != null ?
                                            setState(() {
                                              emailError = provider.validateEmail(email: email.text).toString();
                                            })
                                                :
                                            setState(() {
                                              emailError ='';
                                            });

                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        InputError(text: emailError,),
                        const SizedBox(height: 12,),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 0.8,
                                          blurRadius: 20)
                                    ]),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 18, right: 10),
                                      child: const Icon(Icons.lock,
                                        size: 30,
                                        color: AppColors.primaryTwo,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.only(right: 20),
                                        child: TextFormField(
                                          obscureText: _obscureText ? false : true,
                                          controller: password,
                                          style: AppTypography()
                                              .headline1
                                              .copyWith(fontWeight: FontWeight.w400),
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              hintText: "Mot de passe",
                                              label: Text(
                                                "Mot de passe",
                                                style: AppTypography()
                                                    .headline1
                                                    .copyWith(fontWeight: FontWeight.w400),
                                              ),
                                              suffixIcon: AppInkwell(
                                                child: Icon(
                                                  _obscureText
                                                      ? Icons.visibility_outlined
                                                      : Icons.visibility_off_outlined,
                                                  color: AppColors.hintColor,
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    _obscureText = !_obscureText;
                                                  });
                                                },
                                              )),
                                          onChanged: (value) {
                                            provider.getPassword(value);
                                          },
                                          validator: (value) {
                                            provider.validatePassword(userPassword: password.text) != ''?
                                            setState(() {
                                              passwordError = provider.validatePassword(userPassword: password.text)!;
                                            })
                                            : setState(() {
                                              passwordError = '';
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        InputError(text: passwordError,),
                        const SizedBox(height: 12,),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 0.8,
                                          blurRadius: 20)
                                    ]),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 18, right: 10),
                                      child: const Icon(Icons.lock,
                                        size: 30,
                                        color: AppColors.primaryTwo,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.only(right: 20),
                                        child: TextFormField(
                                          obscureText: _obscureTextCorrect ? false : true,
                                          controller: confirmPassword,
                                          style: AppTypography()
                                              .headline1
                                              .copyWith(fontWeight: FontWeight.w400),
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              hintText: "Confirmer mot de passe",
                                              label: Text(
                                                "Confirmer mot de passe",
                                                style: AppTypography()
                                                    .headline1
                                                    .copyWith(fontWeight: FontWeight.w400),
                                              ),
                                              suffixIcon: AppInkwell(
                                                child: Icon(
                                                  _obscureTextCorrect
                                                      ? Icons.visibility_outlined
                                                      : Icons.visibility_off_outlined,
                                                  color: AppColors.hintColor,
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    _obscureTextCorrect = !_obscureTextCorrect;
                                                  });
                                                },
                                              )),
                                          onChanged: (value) {
                                            provider.getConfirmPassword(value);
                                          },
                                          validator: (value) {

                                             provider.validateConfirmationPassword(
                                                userPassword: password.text,
                                                userConfirmPass: confirmPassword.text) != ''?
                                             setState(() {
                                                confirmPasswordError = provider.validateConfirmationPassword(
                                                    userPassword: password.text,
                                                    userConfirmPass: confirmPassword.text)!;
                                             }):
                                             setState(() {
                                               confirmPasswordError = '';
                                             });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        InputError(text: confirmPasswordError,),
                        const SizedBox(height: 12,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                              child:  Checkbox(
                                  checkColor: AppColors.white,
                                  activeColor: AppColors.primaryTwo,
                                  value: checkedValue,
                                  onChanged: (bool? value) {

                                    setState(() {
                                      checkedValue = value!;
                                    });
                                  }
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                textAlign: TextAlign.left,
                                softWrap: true,
                                text: TextSpan(
                                    text: "En vous inscrivant vous acceptez notre ",
                                    style: AppTypography().authText,
                                    children: [
                                      TextSpan(
                                        text: "politique de confidentialité ",
                                        style: AppTypography().authText.copyWith(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.green),
                                      ),
                                      TextSpan(
                                        text: "&",
                                        style: AppTypography().authText,
                                      ),
                                      TextSpan(
                                        text: " Nos termes et conditions. ",
                                        style: AppTypography().authText.copyWith(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.green),
                                      )
                                    ]),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12,),
                        AppButton(
                          text: !authProvider.requestLoading ? 'S’inscrire' : '',
                          widget: authProvider.requestLoading
                              ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                              : null,
                          onTap: provider.isValidSecurity && provider.isValid
                              ? () async {
                            if (infoFormKey.currentState!.validate() && formIsValid()) {
                              RegisterRequest payload = RegisterRequest(
                                firstname: provider.firstname,
                                lastname: provider.lastname,
                                email: provider.mail,
                                password: provider.password, phone: provider.phone.toString(),
                              );

                              print(payload.toString());
                              bool success =
                              await authProvider.register(payload);

                              if (success) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Compte créé avec succès',
                                      style: AppTypography().authText.copyWith(
                                        color: AppColors.white
                                      ),
                                    ),
                                    backgroundColor: Colors.green.shade300,
                                  ),
                                );
                                context.pushReplacement(AppPage.login.toPath);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      authProvider.errorMessage,
                                      style: AppTypography().authText,
                                    ),
                                    backgroundColor: Colors.red.shade300,
                                  ),
                                );
                              }
                            }
                          }
                              : null,
                          backgroundColor: provider.isValidSecurity && provider.isValid
                              ? AppColors.primaryTwo
                              : AppColors.hintColor,
                          raduis: BorderRadius.all(Radius.circular(15)),
                        ),
                      ],
                    );
                  }),


                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Déjà inscrit ? ",
                        style: AppTypography().headline1,
                      ),
                      AppInkwell(
                          onTap: () {
                            context.push(AppPage.login.toPath);
                          },
                          child: Text(
                            "Connectez-vous",
                            style: AppTypography().authText.copyWith(
                                fontSize: 14,
                                color: Colors.green,
                                decoration: TextDecoration.underline),
                          )),
                    ],
                  ),
                  SizedBox(height: 22,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InputError extends StatelessWidget {
  const InputError({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: text == ''? false: true ,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.symmetric(horizontal: 40,),
              child: Text(text,
                softWrap: true,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 10
                ),),
            ),
          ),
        ],
      ),
    );
  }
}
