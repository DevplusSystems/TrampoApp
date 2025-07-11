class VerifyOtp {
  final String otp;
  final String user;

  VerifyOtp({required this.otp, required this.user});
  Map<String, dynamic> toJson() {
    return {
      'otp': otp,
      'user': user,
    };
  }
}