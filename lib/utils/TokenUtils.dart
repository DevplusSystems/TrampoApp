import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class TokenUtils {


  static int? getIdFromToken(String token) {
    try {
      // Decode the JWT
      final jwt = JWT.decode(token);

      // Extract the claim "patient_id" and convert it to an int
      final patientIdString = jwt.payload['patient_id']?.toString();

      // Convert the extracted patient_id to int, if it's not null and valid
      if (patientIdString != null) {
        return int.tryParse(patientIdString);  // Safely convert to int
      }

      return null;  // Return null if patient_id is missing or invalid
    } catch (e) {
      // Handle exceptions (invalid token, missing claim, etc.)
      print('Error decoding token: $e');
      return null;  // Return null if an error occurs
    }
  }



// static String? getIdFromToken(String token) {
  //   try {
  //     // Decode the JWT
  //     final jwt = JWT.decode(token);
  //
  //     // Extract the claim "patient_id" and return it as a String
  //     return jwt.payload['patient_id']?.toString();
  //   } catch (e) {
  //     // Handle exceptions (invalid token, missing claim, etc.)
  //     print('Error decoding token: $e');
  //     return null;
  //   }
  // }
}
