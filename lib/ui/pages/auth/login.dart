import 'dart:async';

import 'package:location_app/export.dart';
import 'package:location_app/ui/pages/auth/widget/sign_template.dart';

import '../../../core/controllers/auth/auth_controller.dart';
import '../../../core/provider/validator/inscription_provider.dart';
import '../../../core/service/api/auth/auth_service.dart';
import '../../../ressources/theme/color/app_color.dart';
import '../../../utils_/constants/space.dart';
import '../../common/app_inkwell.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String emailError = '';
  String passwordError = '';

  bool _obscureText = true;
  GlobalKey<FormState> infoFormKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scheduleMicrotask(() async {
      Provider.of<ValidatorProvider>(context, listen: false).isauth;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ValidatorProvider>(context);
    return  Scaffold(
      backgroundColor: AppColors.primaryTwo,
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.chevron_left,
          color: Colors.white,
        ),
        title: const Text('Se connecter ',
          style: TextStyle(
            color: Colors.white
          ),
          ),
        backgroundColor: AppColors.primaryTwo,
        ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24,),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 22,),
                Text(
                  'Connectez vous à votre compte',
                  style: AppTypography().medium.copyWith(
                      color: AppColors.primaryTwo, fontWeight: FontWeight.w600),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SpaceH(15),
                    Text(
                      "Vous n’avez pas de compte ? ",
                      style: AppTypography().headline1,
                    ),
                    Expanded(
                      child: AppInkwell(
                          onTap: () {
                            context.push(AppPage.signIn.toPath);
                          },
                          child: Text(
                            "Inscrivez-vous",
                            style: AppTypography().authText.copyWith(
                                fontSize: 14,
                                color: Colors.green,
                                decoration: TextDecoration.underline),
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 54,),
                Center(child: SvgPicture.asset($AppAssets.svgs.image_inscription)),
                const SizedBox(height: 12,),
              Consumer<AuthController>(
                  builder: (context, authProvider, child) {
                    return Form(
                      key: infoFormKey,
                      child: Column(
                        children: [
                          const SpaceH(24),
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
                          const SpaceH(12),

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
                                            controller: password,
                                            obscureText: _obscureText,
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
                                                    !_obscureText
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
                          const SpaceH(12),

                          AppButton(
                            text: !authProvider.requestLoading ? 'Se connecter' : '',
                            widget: authProvider.requestLoading
                                ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                                : null,
                            onTap: provider.isauth
                                ? () async {
                              if (infoFormKey.currentState!.validate() && email.text.isNotEmpty && password.text.isNotEmpty) {
                                bool res = await authProvider.login(
                                    email.text, password.text);
                                print(res);
                                if (!res) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        authProvider.errorMessage,
                                        style: AppTypography().authText,
                                      ),
                                      backgroundColor: Colors.red.shade300,
                                    ),
                                  );
                                  authProvider.hasError = false;
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Connexion réussie',
                                        style: AppTypography().authText.copyWith(
                                            color: AppColors.white
                                        ),
                                      ),
                                      backgroundColor: Colors.green.shade300,
                                    ),
                                  );
                                  context.pushReplacement(
                                      AppPage.dashboard.toPath);
                                }
                              }
                            }
                                : null,
                            backgroundColor: provider.isauth && email.text.isNotEmpty && password.text.isNotEmpty
                                ? AppColors.primaryTwo
                                : AppColors.hintColor,
                            raduis: const BorderRadius.all(Radius.circular(15)),
                          )
                        ],
                      ),
                    );
                  }),
                const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppInkwell(
                        onTap: () {
                          context.push(AppPage.login.toPath);
                        },
                        child: Text(
                          "Mot de passe oublié? ",
                          style: AppTypography().authText.copyWith(
                              fontSize: 14,
                              color: Colors.green,
                              decoration: TextDecoration.underline),
                        )),
                  ],
                ),
                const SizedBox(height: 22,),
              ],
            ),
          ),
        ),
      )
      );

  }

  login() {
    AuthService service = AuthService();

    service.login(email.text, password.text);
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
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.symmetric(horizontal: 40,),
              child: Text(text,
                softWrap: true,
                style: const TextStyle(
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