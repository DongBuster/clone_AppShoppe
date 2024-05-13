import 'dart:io';

import 'package:flutter/material.dart';

import '../models/introduction_page_model.dart';

class StateIntroductionPage extends ChangeNotifier {
  IntroductionPageModel introductionPageModel =
      IntroductionPageModel(imageFile: null, userId: null);
  void setImageFile(File? file) {
    introductionPageModel.setImageFile = file;
    notifyListeners();
  }

  void setUserId(String id) {
    introductionPageModel.setUserId = id;
    notifyListeners();
  }
}
