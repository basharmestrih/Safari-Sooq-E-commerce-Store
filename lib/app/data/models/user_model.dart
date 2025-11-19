class User {
  final String email;
  final String userName;      // changed from username
  final String firstName;
  final String lastName;
  final String mobile;        // changed from mobilePhone
  final String password;
  final String confirmPassword;
  final int gender;           // changed from String to int
  final DateTime birthDate;
  final int countryId;

  User({
    required this.email,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.password,
    required this.confirmPassword,
    required this.gender,
    required this.birthDate,
    required this.countryId,
  });

  // Convert User -> Map (for API)
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "userName": userName,           // matches API
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,               // matches API
      "password": password,
      "confirmPassword": confirmPassword,
      "gender": gender,               // int value
      "birthDate": birthDate.toIso8601String(),
      "countryId": countryId,
    };
  }

  // Convert Map -> User (from API)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json["email"],
      userName: json["userName"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      mobile: json["mobile"],
      password: json["password"],
      confirmPassword: json["confirmPassword"],
      gender: json["gender"],
      birthDate: DateTime.parse(json["birthDate"]),
      countryId: json["countryId"],
    );
  }
}
