/*import 'package:dio/dio.dart';
import 'package:visitbj/core/models/category.dart';
import 'package:visitbj/core/service/api/api_endpoints.dart';
import 'package:visitbj/core/service/api/api_service.dart';

class CategoryService extends ApiService {
  Future<List<Category>> findAll() async {
    List<Category> categories = [];
    try {
      Response response = await dio.get(ApiEndpoint.category);

      if (response.statusCode == 200) {
        response.data['data'].forEach((category) {
          categories.add(Category.fromJson(category));
        });
      }
    } catch (e) {
      throw Exception('Une erreur est survenue');
    }

    return categories;
  }
}
*/