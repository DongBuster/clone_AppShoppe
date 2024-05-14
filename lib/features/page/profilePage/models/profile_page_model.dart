import 'dart:io';

class ProfilePageModel {
  File? imageFile;
  ProfilePageModel({
    this.imageFile,
  });
  ProfilePageModel.itinial() {
    imageFile = null;
  }
}
