class AppConst {
  static String? TOKEN = "";
  static const String keyId = "employeeId";
  static const String leaveRequestParam = "leaveRequest";
  static const String attendanceRequestParam = "attendanceRequest";
  static const String requestType = "requestType";

  // Date formats
  static const String serverDateFormat = "yyyy-MM-dd";
  static const String serverDateFormatAttendance = "yyyy-MM-dd";
  static const String attendanceDateFormat = "yyyy-MM-dd HH:mm:ss";
  static const String resourceDateFormat = "yyyy-MM-dd HH:mm:ss.SSSSSS";

  static const String expenseRequestParam = "expenseRequest";
  static const String expenseRequestIdParam = "expenseId";
  static const String expenseRequestAttachments = "expenseAttachments";

  static const String hoursRequestIdParam = "hoursId";
  static const String hoursRequestParam = "hoursRequest";

  // Placeholder for observable code
  static ObservableCode observableCode = ObservableCode();
}

class ObservableCode {
  int? value;

  void set(int newValue) {
    value = newValue;
    print("Status code updated: $value");
  }
}
