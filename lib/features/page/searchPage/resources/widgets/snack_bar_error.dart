import 'package:flutter/material.dart';

SnackBar snackBarError(BuildContext context, String errorMessage) {
  return SnackBar(
    padding: const EdgeInsets.all(8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    duration: const Duration(milliseconds: 3000),
    content: Center(
      child: Text(
        errorMessage,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    ),
    backgroundColor: Colors.white,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      bottom: MediaQuery.of(context).size.height / 2,
      right: 120,
      left: 120,
    ),
  );
}
