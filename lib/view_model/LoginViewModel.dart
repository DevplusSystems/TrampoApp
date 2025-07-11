import 'package:flutter/material.dart';

import '../models/BaseApiModel.dart';
import '../models/login/LoginRequest.dart';
import '../models/login/LoginResponse.dart';
import '../models/login/VerifyOtp.dart';
import '../models/login/VerifyOtpResponse.dart';
import '../repository/user_repository.dart';
import 'base_view_model.dart';


class LoginViewModel extends BaseViewModel {
  final UserRepository _userRepository;
  LoginViewModel(this._userRepository);

  // Login response model
  BaseApiModel<LoginResponse>? loginResponse;

  // OTP verification response model
  BaseApiModel<VerifyOtpResponse>? verifyOtpResponse;

  // Login method
  Future<void> login(String emailOrUsername, String password) async {
    isLoading = true;
    notifyListeners(); // Notify listeners to update UI

    try {
      final loginRequest = LoginRequest(email_or_username: emailOrUsername, password: password);
      loginResponse = await _userRepository.login(loginRequest);

      // Check the response status
      if (loginResponse?.metaData.statusCode == 200) {
        successMessage = "Login successful!"; // Set success message
        print("Login successful! User: ${loginResponse?.data?.email}");
      } else {
        errorMessage = loginResponse?.metaData.message ?? "Unknown error";
      }
    } catch (error) {
      errorMessage = error.toString();
    } finally {
      isLoading = false;
      notifyListeners(); // Notify listeners after processing
    }
  }

  // OTP verification method
/*
  Future<void> verifyOtp(String otp, String userId) async {
    isLoading = true;
    notifyListeners(); // Notify listeners to update UI

    try {
      final verifyOtp = VerifyOtp(otp: otp, user: userId);
      verifyOtpResponse = await _userRepository.verifyOtp(verifyOtp);

      // Check the response status
      if (verifyOtpResponse?.metaData.statusCode == 200) {
        successMessage = "OTP Verified"; // Set success message
        print("Token: ${verifyOtpResponse?.data?.access_token}");
      } else {
        errorMessage = verifyOtpResponse?.metaData.message ?? "Unknown error";
      }
    } catch (error) {
      errorMessage = error.toString();
    } finally {
      isLoading = false;
      notifyListeners(); // Notify listeners after processing
    }
  }
*/
}

