

import 'Meta.dart';

class BaseApiModel<T> {
  final Meta metaData;
  final T data;
  final String message;

  BaseApiModel({
    required this.metaData,
    required this.data,
    required this.message,
  });

  factory BaseApiModel.fromJson(
      Map<String, dynamic> json, T Function(dynamic) dataFromJson) {
    return BaseApiModel(
      metaData: Meta.fromJson(json['meta_data']),
      data: dataFromJson(json['data']),
      message: json['message'] as String,
    );
  }
}

// class BaseApiModel<T> {
//   final Meta metaData;
//   final T? data;
//   BaseApiModel({required this.metaData, this.data});
//
//   factory BaseApiModel.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) create) {
//     return BaseApiModel(
//       metaData: Meta.fromJson(json['meta_data']),
//       data: json['data'] != null ? create(json['data']) : null,
//     );
//   }
// }
