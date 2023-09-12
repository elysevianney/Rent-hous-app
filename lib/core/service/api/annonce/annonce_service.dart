import 'package:dio/dio.dart';
import 'package:location_app/core/models/post.dart';

import '../../storage.dart';
import '../api_endpoints.dart';
import '../api_service.dart';

class AnnonceService extends ApiService {

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
        for(int i = 0; i< response.data['count']; i++){
          final chef = response.data['data'][i];
          final ann =(Annonce.fromJson( chef as Map<String, dynamic>));
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

}
