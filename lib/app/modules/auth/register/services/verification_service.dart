import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../Core/constants/api_endpoints.dart';

class VerificationService {
  static Future<Map<String, dynamic>> verifyCode(
    Map<String, dynamic> payload,
  ) async {
    final url = Uri.parse(ApiEndpoints.registerVerifyOtp);

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(payload),
    );

    return jsonDecode(response.body);
  }
}
