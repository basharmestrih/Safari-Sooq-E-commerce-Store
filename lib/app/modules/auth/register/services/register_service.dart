import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../Core/constants/api_endpoints.dart';
import '../../../../data/models/user_model.dart';

class RegisterService {
  static Future<Map<String, dynamic>> register(User user, otpReceiver) async {
    final url = Uri.parse(ApiEndpoints.register).replace(
      queryParameters: {
        "otpReciver": otpReceiver.toString(), // make sure it's a string
      },
    );

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(user.toJson()),
      );

      print("🔹 Request URL: $url");
      print("🔹 Request Body: ${jsonEncode(user.toJson())}");
      print("🔹 Response Status: ${response.statusCode}");
      print("🔹 Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          "success": true,
          "data": data,
        };
      } else {
        Map<String, dynamic> errorData = {};
        try {
          errorData = jsonDecode(response.body);
        } catch (e) {
          print("⚠️ Failed to parse error response: $e");
        }

        return {
          "success": false,
          "message": errorData["message"] ?? "Something went wrong",
        };
      }
    } catch (e) {
      print("❌ Exception during register request: $e");
      return {
        "success": false,
        "message": "Exception occurred: $e",
      };
    }
  }
}
