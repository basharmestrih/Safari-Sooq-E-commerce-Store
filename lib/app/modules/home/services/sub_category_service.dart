// services/sub_category_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../Core/constants/api_endpoints.dart';
import '../../../data/models/sub_category.dart';

class SubCategoryService {

  SubCategoryService();
//FETCH SELECTED SUB CATEGORY
  Future<List<SubCategoryModel>> fetchSubCategories(int categoryId) async {
     final url = Uri.parse("${ApiEndpoints.subCategs}/$categoryId");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      final List<dynamic> data = body['data'] ?? [];

      return data.map((json) => SubCategoryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load subcategories');
    }
  }
}
