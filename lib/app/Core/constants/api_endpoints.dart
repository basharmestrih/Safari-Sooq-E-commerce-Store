class ApiEndpoints {
  // Base URL (change once if server changes)
  static const String baseUrl = "https://web.safarisooq.net/api";

  // Auth
  static const String login = "$baseUrl/users/login";
  static const String register = "$baseUrl/users/register";
  static const String registerVerifyOtp = "$baseUrl/users/password/verify-otp";

  // Forget Password
  static const String passwordBase = "$baseUrl/users/password";
  static const String forgotPassword = "$baseUrl/users/password/forgot";
  static const String verifyOtp = "$passwordBase/verify-otp";
  static const String resetPassword = "$baseUrl/users/password/reset";
  // Home
  static const String mainCategs = "$baseUrl/categories";
  static const String subCategs = "$baseUrl/subcategories";


}
