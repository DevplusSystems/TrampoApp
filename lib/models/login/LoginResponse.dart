
class LoginResponse {
  final int id;
  final String email;

  LoginResponse({required this.id, required this.email});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      id: json['id'],
      email: json['email'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
    };
  }
}
