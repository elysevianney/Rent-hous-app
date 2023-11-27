import 'dart:io';

import 'package:dio/dio.dart';
import 'package:location_app/core/models/post.dart';

import '../../../models/payloads/createPost_request.dart';
import '../../storage.dart';
import '../api_endpoints.dart';
import '../api_service.dart';

class AnnonceService extends ApiService {

  final StorageService storageService = StorageService();
  String? token;
  String? id;
  Future<void> _initializeUser() async {
    token = await storageService.getUserToken();
    id = await storageService.getUserId();
  }

  Options _getOptions() {
    return Options(
        contentType: Headers.multipartFormDataContentType,
        headers: {
      "Authorization": "Bearer $token",
    });
  }

  Future<List<Annonce>?> getAnnonce() async {
    await _initializeUser();
    List<Annonce>? annonces = [];

    try {
      Response response = await dio.get(
        ApiEndpoint.annonce,
        options: _getOptions(),

      );
      print(response.data['data']);
      if (response.statusCode == 200) {
        for(var element in response.data['data']){
          //final chef = response.data['data'][i];
          final ann =(Annonce.fromJson( element as Map<String, dynamic>));
          annonces.add(ann);
        }
        /*response.data.forEach(( annonce) {

          annonces.add(AnnonceFromJson( annonce['data'].toString()));
          return ;
        });*/

        return annonces;
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['detail']);
    }
    return annonces;
  }
  Future<Annonce?> viewAnnonce( String id) async {
    await _initializeUser();
    Annonce? annonce;

    try {
      Response response = await dio.get(
        ApiEndpoint.annonceview + id +"/",
        options: _getOptions(),

      );

      if (response.statusCode == 200) {
        print(response);
          final dynamic chef = response as dynamic;
          final ann =(AnnonceFromJson( chef.toString()));
          annonce=(ann);

        /*response.data.forEach(( annonce) {

          annonces.add(AnnonceFromJson( annonce['data'].toString()));
          return ;
        });*/

        return annonce;
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['detail']);
    }
    return annonce;
  }

  Future<bool?> createAnnonce(CreatePostRequest payload) async {
    await _initializeUser();
    bool? result;

    try {

      print(token);
      print(payload.image);
      print(payload.mapToJson());

      final List<MultipartFile> imagess = [];

     /* FormData data = FormData();
      for(var element in payload.image){
        String fileName = element.path.split('/').last;
        var mfile = MultipartFile.fromFile(element.path, filename:fileName);
        imagess.add(MapEntry('file', mfile) as MultipartFile);
        /*FormData data = FormData.fromMap({
          "file": await MultipartFile.fromFile(element.path, filename:fileName),
          "image": imagess,
          "ville": "string",
          "quatier": "string",
          "prix": 2147483647,
          "nbre_douche": 2147483647,
          "nbre_chambre": 2147483647,
          "nbre_personne": 2147483647,
          "description": "string",
          "date": "2023-09-13",
          "sanitaire": true,
          "electricite": true,
          "eau": true,
          "carrele": true,
          "status": true,
          "deleted": true,
          "user": ""
        });
        imagess.add(data);*/

      }

      for(var element in imagess){
        data.files.add(element as MapEntry<String, MultipartFile>)

      }*/

      FormData formdata = FormData.fromMap({

        'image': [
          for (var file in payload.image)

          // ....spred images

            ...{
              await MultipartFile.fromFile(
                  file.path,
                  filename: file.path.split('/').last)
            }.toList()
        ],
        "ville": payload.ville,
        "quatier": payload.quatier,
        "prix": payload.prix,
        "nbre_douche": payload.nbreDouche,
        "nbre_chambre": payload.nbreChambre,
        "nbre_personne": payload.nbrePersonne,
        "description":  payload.description,
        "date": "2023-09-13",
        "sanitaire": true,
        "electricite": true,
        "eau": true,
        "carrele": true,
        "status": true,
        "deleted": false,
        "user": id
      });


      Response response = await dio.post(
        ApiEndpoint.annonceCreate,
        data: formdata,
        options: _getOptions(),
      );

      print(response);
      if (response.statusCode == 201) {

          return true;
        }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    }
    return false;
  }

}
/*
{
          "image": [

          ],
          "ville": payload.ville,
          "quatier": payload.quatier,
          "prix": payload.prix,
          "nbre_douche": payload.nbreDouche,
          "nbre_chambre": payload.nbreChambre,
          "nbre_personne": payload.nbrePersonne,
          "description":  payload.description,
          "date": "2019-08-24",
          "sanitaire": true,
          "electricite": true,
          "eau": true,
          "carrele": true,
          "status": true,
          "deleted": true,
          "user": ""
        }
 */