import '../models/BaseApiModel.dart';
import '../models/login/LoginRequest.dart';
import '../models/login/LoginResponse.dart';
import '../models/login/VerifyOtp.dart';
import '../models/login/VerifyOtpResponse.dart';
import '../services/api_service.dart';

class UserRepository {
  final ApiService _apiService;

  UserRepository(this._apiService);

  Future<BaseApiModel<LoginResponse>> login(LoginRequest loginRequest) async {
    // Call the login method from ApiService
    final response = await _apiService.userLoginApiCall(loginRequest);

    // // Additional logic if needed (e.g., save tokens locally)
    // if (response.metaData.success ?? false) {
    //   // Save access token or other necessary info
    //   // e.g., SharedPreferences, database, etc.
    // }


    return response;
  }
  /*Future<BaseApiModel<VerifyOtpResponse>> verifyOtp(VerifyOtp verifyOtp) async {
    // Call the login method from ApiService
    final response = await _apiService.verifyOtpApiCall(verifyOtp);

    // // Additional logic if needed (e.g., save tokens locally)
    // if (response.metaData.success ?? false) {
    //   // Save access token or other necessary info
    //   // e.g., SharedPreferences, database, etc.
    // }

    return response;
  }*/
}
