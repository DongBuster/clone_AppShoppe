import 'dart:io';

class IntroductionPageModel {
  String? userId;
  File? imageFile;
  IntroductionPageModel({
    required this.imageFile,
    required this.userId,
  });
  get getUserId => userId;
  set setUserId(String id) => userId = id;

  get getImageFile => imageFile;
  set setImageFile(File? file) => imageFile = file;

  @override
  bool operator ==(covariant IntroductionPageModel other) {
    if (identical(this, other)) return true;

    return other.imageFile == imageFile;
  }

  @override
  int get hashCode => imageFile.hashCode;
}
