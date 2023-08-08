import 'package:location_app/export.dart';

class ValidatorProvider extends ChangeNotifier {
  String lastname = "";
  String firstname = "";

  String mail = "";
  String password = "";
  String passwordConfirm = "";



  bool get isValid {
    if (lastname.isNotEmpty && firstname.isNotEmpty) {
      print("lastname =>$lastname , firstname=>$firstname,");
      return true;
    } else {
      return false;
    }
  }

  bool get isValidSecurity {
    if (mail.isNotEmpty && password.isNotEmpty && passwordConfirm.isNotEmpty) {
      print(
          "mail =>$mail , password=>$password,passwordConfirm =>$passwordConfirm ");

      return true;
    } else {
      return false;
    }
  }

  bool get isauth {
    if (mail.isNotEmpty && password.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }


  //check lastname
  String? validateLastName({required String? userLastname}) {
    if (userLastname!.isEmpty) {
      return 'Veuillez saisir votre nom';
    }
    lastname = userLastname.replaceAll(' ', '');
    notifyListeners();
    return '';
  } // end validateLastName


  String? validateCode({required String code}) {
    if (code.isEmpty) {
      return 'Veuillez entrer le code';
    }
    notifyListeners();
    return '';
  } // end validateLastName

  //check firstname
  String? validateFirstName({required String? userFirstName}) {
    if (userFirstName!.isEmpty) {
      return 'Veuillez saisir votre prénom';
    }
    firstname = userFirstName.replaceAll(' ', '');
    notifyListeners();
    return '';
  } // end firstname




  getFirstname(String firsname) {
    firstname = firsname;
    notifyListeners();
  }


  getLastName(String lastName) {
    lastname = lastName;
    notifyListeners();
  }

  getEmail(String Email) {
    mail = Email;
    notifyListeners();
  }

  getPassword(String passwords) {
    password = passwords;
    notifyListeners();
  }

  getConfirmPassword(String confirmPassword) {
    passwordConfirm = confirmPassword;
    notifyListeners();
  } //end getSexe

//check email
  String? validateEmail({required String? email}) {
    Pattern pattern =
        r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$'; // r'^[a-zA-Z.]+@[a-zA-Z.]';
    RegExp regex = RegExp(pattern as String);
    if (email!.isEmpty) {
      return 'Veuillez saisir votre adresse email';
    } else if (!regex.hasMatch(email)) {
      return 'Veuillez saisir une adresse email valide';
    }
    mail = email;
    notifyListeners();
    return '';
  } //end validateEmail

//check  password
  String? validatePassword({required String? userPassword}) {
    final regex =
        RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');
    if (userPassword!.isEmpty) {
      return 'Veuillez saisir votre mot de passe';
    } else if (userPassword.length <= 8 && !regex.hasMatch(userPassword)) {
      return 'Veuillez saisir 8 caractères avec une majuscule,une minuscule et un symbole au moins';
    }
    password = userPassword;
    notifyListeners();
    return '';
  } //end validatePassword

//check confirmation password
  String? validateConfirmationPassword(
      {required String? userConfirmPass, required String? userPassword}) {
    final regex =
        RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$');

    if (userConfirmPass!.isEmpty) {
      return 'Veuillez confirmer votre mot de passe';
    }
    if (userConfirmPass.length <= 8 && !regex.hasMatch(userConfirmPass)) {
      return 'Veuillez saisir 8 caractères avec une majuscule,une minuscule et un symbole au moins';
    } else if (userConfirmPass != userPassword) {
      return "Mot de passe et confirmation non identiques";
    }
    notifyListeners();
    return '';
  } //end validateConfirmationPassword

// onChange controle espace sur les champs de saisir
  onchangeController(String value, TextEditingController textController) {
    if (value.contains(' ')) {
      textController.text = value.replaceAll(' ', '');
      textController.selection = TextSelection.fromPosition(
        TextPosition(offset: textController.text.length),
      );
    }
    notifyListeners();
  }
// end onchangeController
}
