import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../Core/constants/api_endpoints.dart';

class LoginService {
  Future<Map<String, dynamic>> login({
    required String identifier,
    required String password,
  }) async {
    final url = Uri.parse(ApiEndpoints.login);

   final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        "userNameOrPhoneNumber": identifier,
        "password": password,
      }),
    );
if (response.statusCode == 200) {
  final decoded = jsonDecode(response.body); // this gives String
  final data = jsonDecode(decoded);          // now we get Map<String,dynamic>
  return data;
} else {
  throw Exception("Login failed: ${response.body}");
}

  }
}
