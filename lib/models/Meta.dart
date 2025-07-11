class Meta {
  final String? message;
  final bool? success;
  final bool? status;
  final int? statusCode;

  Meta({this.message, this.success,this.status, this.statusCode});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      message: json['message'],
      success: json['success'],
      status: json['status'],
      statusCode: json['status_code'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'status_code': statusCode,
      'message': message,
    };
  }
}
