class LoginRequest {
  final String email_or_username;
  final String password;

  LoginRequest({required this.email_or_username, required this.password});
  Map<String, dynamic> toJson() {
    return {
      'email_or_username': email_or_username,
      'password': password,
    };
  }
}
