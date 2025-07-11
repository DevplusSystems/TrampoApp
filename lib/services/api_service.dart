import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/BaseApiModel.dart';
import '../models/UserModel.dart';
import '../models/login/LoginRequest.dart';
import '../models/login/LoginResponse.dart';
import '../utils/ResponseHandler.dart';
import '../utils/SessionManager.dart';

class ApiService {
  // final String baseUrl = "https://flite.khazanapk.com/api/v1/";
  final String baseUrl = "http://13.61.16.188/api/v1";

  Future<BaseApiModel<LoginResponse>> userLoginApiCall(
      LoginRequest loginRequest) async {
    final url = Uri.parse('$baseUrl/accounts/login/');
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(loginRequest.toJson()),
    );

    // Use the common response handler
    return ResponseHandler.handleResponse(
      response,
      (dataJson) => LoginResponse.fromJson(dataJson),
    );
  }

  // Dashboard Response

  Future<BaseApiModel<UserModel>> fetchParentData(int patientId) async {
    final url = Uri.parse('$baseUrl/patient/$patientId');
    // Retrieve the token from SessionManager or other methods
    String? token = SessionManager.getToken(); // Assuming SessionManager is where you store your token
    // Set the token in the request header
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final response = await http.get(url, headers: headers);
    // Use the common response handler
    return ResponseHandler.handleResponse(
      response,
          (dataJson) => UserModel.fromJson(dataJson),
    );
  }
/*
  Future<BaseApiModel<List<EventsResponse>>> fetchStepsToComplete() async {
    final url = Uri.parse('$baseUrl/patient/step-to-complete');
    String? token = SessionManager.getToken(); // Retrieve the token
    final headers = {
      'Authorization': 'Bearer $token',   // Add Bearer token
      'Content-Type': 'application/json', // Specify JSON content type
    };

    try {
      final response = await http.get(url, headers: headers);

      // Handle response
      return ResponseHandler.handleResponse<List<EventsResponse>>(
        response,
            (dataJson) {
          // Ensure 'data' is processed as a List
          var dataList = dataJson as List<dynamic>;
          return dataList
              .map((item) => EventsResponse.fromJson(item as Map<String, dynamic>))
              .toList();
        },
      );
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
*/

  // Future<BaseApiModel<List<Events>>> upcomingEventsData() async {
  //   final url = Uri.parse('$baseUrl/patient/step-to-complete');
  //   String? token = SessionManager.getToken();
  //   final headers = {
  //     'Authorization': 'Bearer $token',
  //     'Content-Type': 'application/json',
  //   };
  //
  //   final response = await http.get(url, headers: headers);
  //
  //   // Handle the response using the ResponseHandler
  //   return ResponseHandler.handleResponse<List<Events>>(
  //     response,
  //         (dataJson) {
  //       // Assuming that the "data" field contains the list
  //       var dataList = dataJson['data'] as List;
  //       return dataList
  //           .map((item) => Events.fromJson(item as Map<String, dynamic>))
  //           .toList();
  //     },
  //   );
  // }


// Future<void> fetchPatientData(int patientId) async {
  //   final url = Uri.parse('$baseUrl/patient/$patientId');
  //
  //   try {
  //     final response = await http.get(url);
  //
  //     if (response.statusCode == 200) {
  //       // Parse the JSON data
  //       final data = jsonDecode(response.body);
  //       print('Patient Data: $data');
  //     } else {
  //       print('Failed to load data. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     print('Error fetching data: $error');
  //   }
  // }

}
