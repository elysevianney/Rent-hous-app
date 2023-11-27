import 'dart:io';

import 'package:dio/dio.dart';
import 'package:location_app/core/models/chat.dart';
import 'package:location_app/core/models/post.dart';

import '../../../models/payloads/createChat_request.dart';
import '../../../models/payloads/createPost_request.dart';
import '../../storage.dart';
import '../api_endpoints.dart';
import '../api_service.dart';

class ChatService extends ApiService {

  final StorageService storageService = StorageService();
  String? token;

  Future<void> _initializeUser() async {
    token = await storageService.getUserToken();
  }

  Options _getOptions() {
    return Options(headers: {
      "Authorization": "Bearer $token",
    });
  }

  Future<List<Chat>> getChat() async {
    await _initializeUser();
    List<Chat>? chats = [];

    try {
      Response response = await dio.get(
        ApiEndpoint.annonce,
        options: _getOptions(),

      );
      print(response.data['data']);
      if (response.statusCode == 200) {
        for(int i = 0; i< response.data['count']; i++){
          final donnee = response.data['data'][i];
          final ann =(Chat.fromJson( donnee as Map<String, dynamic>));
          chats.add(ann);
        }
        /*response.data.forEach(( annonce) {

          annonces.add(AnnonceFromJson( annonce['data'].toString()));
          return ;
        });*/

        return chats;
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['detail']);
    }
    return chats;
  }
  Future<Chat?> viewChat( String id) async {
    await _initializeUser();
    Chat? chat;

    try {
      Response response = await dio.get(
        ApiEndpoint.annonceview + id +"/",
        options: _getOptions(),
      );

      if (response.statusCode == 200) {
        print(response);
        final dynamic chef = response as dynamic;
        final ann =(ChatFromJson( chef.toString()));
        chat=(ann);

        /*response.data.forEach(( annonce) {

          annonces.add(AnnonceFromJson( annonce['data'].toString()));
          return ;
        });*/

        return chat;
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['detail']);
    }
    return chat;
  }

  Future<bool?> createChat(CreateChatRequest payload) async {
    await _initializeUser();
    bool? result;

    try {

      print(token);
      print(payload.mapToJson());
      Response response = await dio.post(
        ApiEndpoint.annonceCreate,
        data: {
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
        },
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
