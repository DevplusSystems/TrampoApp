import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/BaseApiModel.dart';
import '../models/Meta.dart';


class ResponseHandler {
  static final ValueNotifier<int?> observableCode = ValueNotifier<int?>(null);

  static BaseApiModel<T> handleResponse<T>(http.Response response,
      T Function(dynamic) fromJson) {
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return BaseApiModel<T>.fromJson(jsonResponse, fromJson);
    } else {
      // Set the status code in ObservableCode
      observableCode.value = response.statusCode;
      return BaseApiModel(
        metaData: Meta(
          message: _getErrorMessage(response.statusCode),
          success: false,
          statusCode: response.statusCode,
        ), data: null as T,
        message: _getErrorMessage(response.statusCode),
      );
    }
  }

}



// class ResponseHandler {
//   // Method to handle HTTP responses
//   static BaseApiModel<T> handleResponse<T>(
//       http.Response response,
//       T Function(Map<String, dynamic>) fromJson,
//       ) {
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> jsonData = json.decode(response.body);
//       return BaseApiModel.fromJson(jsonData, fromJson);
//     } else {
//       return BaseApiModel(
//         metaData: Meta(
//           message: _getErrorMessage(response.statusCode),
//           success: false,
//           statusCode: response.statusCode,
//         ),
//       );
//     }
//   }

  // Method to get error message based on status code
String _getErrorMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return "Bad Request";
      case 401:
        return "Unauthorized";
      case 403:
        return "Forbidden";
      case 404:
        return "Not Found";
      case 500:
        return "Internal Server Error";
      default:
        return "Something went wrong. Please try again.";
    }
}


// class ResponseHandler {
//   static BaseApiModel<T> handleResponse<T>(
//       http.Response response, T Function(dynamic) fromJson) {
//     if (response.statusCode == 200) {
//       final jsonResponse = jsonDecode(response.body);
//       return BaseApiModel<T>.fromJson(jsonResponse, fromJson);
//     } else {
//       throw Exception('Error: ${response.statusCode}');
//     }
//   }
// }



