import 'package:flutter/material.dart';

void BuildSnakBar(BuildContext context, String messege) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
      content: Text(messege),
    ),
  );
}
