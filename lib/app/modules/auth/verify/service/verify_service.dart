import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../Core/constants/api_endpoints.dart';

class VerifyService {
  Future<Map<String, dynamic>> verifyCode({
    required String phone,
    required String code,
  }) async {
    final url = Uri.parse(ApiEndpoints.registerVerifyOtp);

final response = await http.post(
  url,
  headers: {
    "Content-Type": "application/json",
    "Accept": "application/json",
  },
  body: jsonEncode({
    "userNameOrPhoneNumber": phone,
    "purpose": 2, 
    "code": code,
  }),
);



   

    if (response.statusCode == 200) {
       print(response);
      return jsonDecode(response.body);
    } else {
       print(response);
      throw Exception("Failed to verify code: ${response.body}");
    }
  }
}
