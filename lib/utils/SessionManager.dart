import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AppConst.dart';
import 'RouteNames.dart';

class SessionManager {
  static late SharedPreferences _prefs;

  static const String _isLogin = "IsLoggedIn";
  static const String _isRemember = "IsRememberMe";
  static const String _isSubscription = "isSubscription";
  static const String _isLastRemember = "isLastRemember";

  static const String _keyEmail = "email";
  static const String _keyFName = "firstname";
  static const String _keyLName = "lastname";
  static const String _keyUsername = "username";
  static const String _keyPassword = "password";
  static const String _keyCnic = "cnic";
  static const String _keyToken = "token";
  static const String _keyExpirationTime = "expiration_time";
  static const String _keyPropertyInfo = "property_info";
  static const String _keyPhase = "phase";
  static const String _keyPavilion = "pavilion";
  static const String _keyCluster = "cluster";
  static const String _keyStreet = "street";

  static const String _marketPermission = "marketPermission";
  static const String _advertisingPermission = "advertisingPermission";
  static const String _strictPermission = "stricPermission";
  static const String _notification = "notification";

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Setters for permissions
  static Future<void> setMarketPermission(bool isAllowed) async {
    await _prefs.setBool(_marketPermission, isAllowed);
  }

  static Future<void> setAdvertisingPermission(bool isAllowed) async {
    await _prefs.setBool(_advertisingPermission, isAllowed);
  }

  static Future<void> setStrictlyPermission(bool isAllowed) async {
    await _prefs.setBool(_strictPermission, isAllowed);
  }

  static Future<void> setNotification(bool isAllowed) async {
    await _prefs.setBool(_notification, isAllowed);
  }

  // Getters for permissions
  static bool getMarketPermission() {
    return _prefs.getBool(_marketPermission) ?? false;
  }

  static bool getAdvertisingPermission() {
    return _prefs.getBool(_advertisingPermission) ?? false;
  }

  static bool getStrictlyPermission() {
    return _prefs.getBool(_strictPermission) ?? false;
  }

  static bool getNotification() {
    return _prefs.getBool(_notification) ?? false;
  }

  // Remember me and subscription
  static Future<void> setRememberMe(bool checkValue) async {
    await _prefs.setBool(_isRemember, checkValue);
  }

  static Future<void> setSubscriptionSave(bool checkValue) async {
    await _prefs.setBool(_isSubscription, checkValue);
  }

  static bool getRememberMe() {
    return _prefs.getBool(_isRemember) ?? false;
  }

  static bool getSubscription() {
    return _prefs.getBool(_isSubscription) ?? false;
  }

  // Create login session
  static Future<void> createLoginSession(
      String? username,
      String? userPass,
      String? accessToken,
      bool lastRemember) async {
    await _prefs.setBool(_isLogin, true);
    await _prefs.setBool(_isLastRemember, lastRemember);
    await _prefs.setString(_keyUsername, username ?? "");
    await _prefs.setString(_keyPassword, userPass ?? "");
    await _prefs.setString(_keyToken, accessToken ?? "");
  }

  // Getters for login info
  static String getRememberUserName() {
    return _prefs.getString(_keyUsername) ?? "";
  }

  static String getRememberPassword() {
    return _prefs.getString(_keyPassword) ?? "";
  }

  static bool isLoggedIn() {
    return _prefs.getBool(_isLogin) ?? false;
  }

  static bool checkLogin()
  {
    return isLoggedIn();
  }

  // Logout user
  static Future<void> logoutUser(BuildContext context) async {
    await _prefs.clear(); // Clear all shared preferences data
    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteNames.selectScreen,
          (Route<dynamic> route) => false, // Remove all routes in the stack
    );
  }
  // Logout user

  static Future<void> clearSession(BuildContext context) async {
    // Clear SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    // Reset AppConst values
    AppConst.TOKEN = null;

  /*  // Navigate to Login Screen
    AppNavigator.navigateTo(
      context,
      '/login',
      clearStack: true, // Clear the navigation stack
    );*/
  }


  // User data save methods
  static Future<void> saveCnic(String? cnic) async {
    await _prefs.setString(_keyCnic, cnic ?? "");
  }

  static Future<void> saveFirstName(String? fname) async {
    await _prefs.setString(_keyFName, fname ?? "");
  }

  static Future<void> saveAddress(String? lname) async {
    await _prefs.setString(_keyLName, lname ?? "");
  }

  static Future<void> saveToken(String? token) async {
    await _prefs.setString(_keyToken, token ?? "");
  }

  static Future<void> savePassword(String? password) async {
    await _prefs.setString(_keyPassword, password ?? "");
  }

  static Future<void> saveUserEmail(String? email) async {
    await _prefs.setString(_keyEmail, email ?? "");
  }

  static Future<void> saveUserPropertyInfo(String? propertyInfo) async {
    await _prefs.setString(_keyPropertyInfo, propertyInfo ?? "");
  }

  static Future<void> saveUserPavilion(String? pavilion) async {
    await _prefs.setString(_keyPavilion, pavilion ?? "");
  }

  static Future<void> saveUserPhase(String? phase) async {
    await _prefs.setString(_keyPhase, phase ?? "");
  }

  static Future<void> saveUserStreet(String? street) async {
    await _prefs.setString(_keyStreet, street ?? "");
  }

  static Future<void> saveUserCluster(String? cluster) async {
    await _prefs.setString(_keyCluster, cluster ?? "");
  }

  // Getters for user data
  static String? getUserEmail() {
    return _prefs.getString(_keyEmail);
  }

  static String? getPropertyInfo() {
    return _prefs.getString(_keyPropertyInfo);
  }

  static String? getPhase() {
    return _prefs.getString(_keyPhase);
  }

  static String? getStreet() {
    return _prefs.getString(_keyStreet);
  }

  static String? getCluster() {
    return _prefs.getString(_keyCluster);
  }

  static String? getPavilion() {
    return _prefs.getString(_keyPavilion);
  }

  static String? getPassword() {
    return _prefs.getString(_keyPassword);
  }

  static String? getToken() {
    return _prefs.getString(_keyToken);
  }

  static String? getFirstName() {
    return _prefs.getString(_keyFName);
  }

  static String? getAddress() {
    return _prefs.getString(_keyLName);
  }

  static String? getCnic() {
    return _prefs.getString(_keyCnic);
  }

  // Token expiration check
  static bool isTokenExpired() {
    final expirationTime = _prefs.getInt(_keyExpirationTime) ?? 0;
    return DateTime.now().millisecondsSinceEpoch >= expirationTime;
  }
}
