import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../Core/constants/api_endpoints.dart';

class ForgetPasswordService {

  /// Call the reset password API
  Future<Map<String, dynamic>> forgetpassword({
    required String userNameOrPhoneNumber,
  }) async {
      final url = Uri.parse(ApiEndpoints.forgotPassword).replace(
      queryParameters: {
        "otpReciver": "3", 
      },
    );


    // Prepare the request body
    final body = jsonEncode({
      "userNameOrPhoneNumber": userNameOrPhoneNumber,
    });



    // Send the request
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: body,
    );


    if (response.statusCode == 200) {
      // Decode the JSON response
      final decoded = jsonDecode(response.body);
      return decoded is String ? jsonDecode(decoded) : decoded;
    } else {
      throw Exception("Reset password failed: ${response.body}");
    }
  }
}


  /// Step 2 - Verify OTP
  /*Future<Map<String, dynamic>> verifyOtp({
    required String identifier,
    required String otp,
  }) async {
    final url = Uri.parse(ApiEndpoints.verifyOtp);
    final response = await http.post(url, body: {
      "identifier": identifier,
      "otp": otp,
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to verify OTP: ${response.body}");
    }
  }

  /// Step 3 - Reset Password
  Future<Map<String, dynamic>> resetPassword({
    required String identifier,
    required String resetToken,
    required String newPassword,
  }) async {
    final url = Uri.parse(ApiEndpoints.resetPassword);
    final response = await http.post(url, body: {
      "identifier": identifier,
      "reset_token": resetToken,
      "new_password": newPassword,
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to reset password: ${response.body}");
    }
  }*/

