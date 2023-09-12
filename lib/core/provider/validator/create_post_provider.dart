import 'package:location_app/export.dart';

class PostValidator extends ChangeNotifier {
  List<XFile> imagePickedList = [];
  String ville  = '';
  String quartier = '';
  int nbrPersonnes =  0;
  int nbrChambres = 0;
  int nbrDouches = 0 ;
  int prix =0 ;
  String description = '';
  bool sanitaire = false;
  bool wc = false;
  bool carreaux = false;
  bool electricite = false;
  bool eau = false;

  //check image
  String? validateImage({required List<XFile> imagePickedList}) {
    if (imagePickedList!.isEmpty) {
      return 'Veuillez choisir une ou plusieurs images';
    }
    notifyListeners();
    return '';
  } // end check image

  //check ville
  String? validateVille({required String? ville}){
    if(ville!.isEmpty){
      print('boff');
      return 'Veuillez entrer la ville';
    }
    this.ville = ville.trim();
    notifyListeners();
    return'';
  }

  //check quartier
  String? validateQuartier({required String? quartier}){
    if(quartier!.isEmpty){
      return 'Veuillez entrer le quartier';
    }
    this.quartier = quartier.trim();
    notifyListeners();
    return'';
  }

  //check prix
  String? validatePrix({required String? prix}){
    if(prix.toString()!.isEmpty){
      return 'Veuillez entrer le prix';
    }
    this.prix = prix?.trim() as int;
    notifyListeners();
    return'';
  }

  //check description
  String? validateDescription({required String? description}){
    if(description.toString()!.isEmpty){
      return 'Veuillez entrer une description';
    }
    this.quartier = quartier.trim();
    notifyListeners();
    return'';
  }

  //check nbrPersonne
  String? validateNbrPersonnes({required String? nbrPersonnes} ){
    if(nbrPersonnes!.isEmpty){
      return 'Veillez entrer le nombre de personnes';
    }
    this.nbrPersonnes = nbrPersonnes?.trim() as int;
    return'';
  }

  //check nbrChambres
  String? validateNbrChambres({required String? nbrChambres} ){
    if(nbrChambres!.isEmpty){
      return 'Veillez entrer le nombre de chaambres';
    }
    this.nbrChambres = nbrChambres?.trim() as int;
    return'';
  }

  //check nbrDouches
  String? validateNbrDouches({required String? nbrDouches} ){
    if(nbrDouches!.isEmpty){
      return 'Veillez entrer le nombre de douches';
    }
    this.nbrDouches = nbrDouches?.trim() as int;
    return'';
  }



  setVille(String ville) {
    this.ville = ville;
    notifyListeners();
  }

  setQuartier(String quartier) {
    this.quartier = quartier;
    notifyListeners();
  }

  setPrix(String prix){
    this.prix = prix as int;
    notifyListeners();
  }

  setDescription(String description){
    this.description = description;
    notifyListeners();
  }

  setNbrPersonnes(String nbrPersonnes){
    this.nbrPersonnes = nbrPersonnes as int;
    notifyListeners();
  }

  setNbrChambres(String nbrChambres){
    this.nbrChambres = nbrChambres as int;
    notifyListeners();
  }

  setNbrDouche(String nbrDouches){
    this.nbrDouches = nbrDouches as int;
    notifyListeners();
  }

  setSanitaire(bool sanitaire){
    this.sanitaire = sanitaire;
    notifyListeners();
  }

  setWc(bool wc){
    this.wc = wc;
    notifyListeners();
  }

  setElectricite(bool electricite){
    this.electricite = electricite;
    notifyListeners();
  }

  setCarreaux(bool carreaux){
    this.carreaux = carreaux;
    notifyListeners();
  }

  setEau(bool eau){
    this.eau = eau;
    notifyListeners();
  }


  bool get isValid {
    if (ville.isNotEmpty && quartier.isNotEmpty && nbrPersonnes.isNaN
        && nbrChambres.isNaN && nbrDouches.isNaN && prix.isNaN
        && description.isNotEmpty) {
      print("all champs valid");
      return true;
    } else {
      return false;
    }
  }
  /*String? validateNbrPersonnes({required String? nbrPersonnes} ){
    if(nbrPersonnes!.isEmpty){
      return 'Veillez entrer le nombre de personne';
    }
    this.nbrPersonnes = nbrPersonnes.trim();
    return'';
  }*/

}