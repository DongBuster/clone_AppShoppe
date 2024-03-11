import 'package:flutter/material.dart';

Widget itemsCategory(String imagePaths, String description) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(imagePaths),
          ),
        ),
      ),
      SizedBox(
        width: 70,
        child: Text(
          textAlign: TextAlign.center,
          description,
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
      )
    ],
  );
}
