import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:safarisooqapp/App/Core/constants/api_endpoints.dart';

Future<Map<String, dynamic>> resetPassword({
  required String userNameOrPhoneNumber,
  required String resetToken,
  required String newPassword,
  required String confirmNewPassword,
}) async {
  final url = Uri.parse(ApiEndpoints.resetPassword);

  final body = {
    "userNameOrPhoneNumber": userNameOrPhoneNumber,
    "resetToken": resetToken,
    "newPassword": newPassword,
    "confirmNewPassword": confirmNewPassword,
  };

  print("🔔 Sending Reset Password Request:");
  print("URL: $url");
  print("Body: ${jsonEncode(body)}");

  try {
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode(body),
    );

    print("🔧 Response Status: ${response.statusCode}");
    print("🔧 Response Body: ${response.body}");

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        "Failed to reset password (${response.statusCode}): ${response.body}",
      );
    }
  } catch (e) {
    print("❌ Error occurred during API call: $e");
    rethrow;
  }
}
