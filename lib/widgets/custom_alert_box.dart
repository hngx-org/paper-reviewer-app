import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  String? title;
  final String? message;
  final VoidCallback? onConfirm;

  CustomAlertDialog({
    this.title, this.message, this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title!),
      content: Text(message!),
      actions: <Widget>[
        TextButton(
          child: Text('OK'),
          onPressed: onConfirm,
        ),
      ],
    );
  }
}