
class VerifyOtpResponse {
  final String access_token;
  final String refresh_token;

  VerifyOtpResponse({required this.access_token, required this.refresh_token});

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponse(
      access_token: json['access_token'],
      refresh_token: json['refresh_token'],
    );
  }
}
