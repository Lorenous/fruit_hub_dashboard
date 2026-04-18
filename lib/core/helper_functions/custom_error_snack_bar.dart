import 'package:flutter/material.dart';

void buildErrorSnackBar(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(errorMessage)));
}
