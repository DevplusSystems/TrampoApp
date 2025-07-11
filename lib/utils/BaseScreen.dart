import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

abstract class BaseScreen extends StatelessWidget{

  void showSnackBar(
      BuildContext context,
      {
        required String message,
        Color backgroundColor = Colors.black,
        Duration duration = const Duration(seconds: 3),
        SnackBarAction? action,
      }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: backgroundColor,
        duration: duration,
        action: action,
      ),
    );
  }
  showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
    );
  }
  bool isValueQualified(String value) {
    return value.isNotEmpty; // example condition
  }
}
