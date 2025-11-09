import 'package:flutter/material.dart';

class CustomDialog {
  static void showErrorDialog(
      BuildContext context, {
        required String title,
        required String message,
      }) {
    showDialog(
      context: context,
      barrierDismissible: true, // allow tap outside to close
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
