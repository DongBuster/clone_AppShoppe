import 'dart:io';

import 'package:flutter/material.dart';

class IntroductionInheritedData extends InheritedWidget {
  File? imageFile;

  IntroductionInheritedData(
      {super.key, required this.imageFile, required Widget child})
      : super(child: child);
  @override
  bool updateShouldNotify(IntroductionInheritedData oldWidget) {
    return oldWidget.imageFile != imageFile;
  }

  static IntroductionInheritedData maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<IntroductionInheritedData>()!;
  }
}
