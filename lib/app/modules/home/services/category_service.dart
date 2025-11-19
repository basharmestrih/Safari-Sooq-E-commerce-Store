// services/category_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../Core/constants/api_endpoints.dart';
import '../../../data/models/main_category.dart';

class CategoryService {
  final url = Uri.parse(ApiEndpoints.mainCategs);


  CategoryService();

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      final List<dynamic> data = body['items'] ?? [];

      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
