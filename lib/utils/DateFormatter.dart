import 'package:intl/intl.dart';  // Import the intl package

// DateFormatter class to format dates
class DateFormatter {
  // Static method to format a given date string
  static String formatDate(String date) {
    try {
      // Parse the string into a DateTime object
      DateTime parsedDate = DateTime.parse(date);  // Expecting the date to be in the format "yyyy-MM-dd"

      // Format the DateTime object into the desired format (e.g., "Aug 30")
      return DateFormat('MMM dd').format(parsedDate);
    } catch (e) {
      // Return a default value in case of an error
      return 'Invalid date';
    }
  }
}
