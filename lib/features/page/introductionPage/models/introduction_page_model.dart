import 'dart:io';

class IntroductionPageModel {
  String? userId;
  File? imageFile;
  IntroductionPageModel({
    required this.imageFile,
    required this.userId,
  });

  IntroductionPageModel.itinial() {
    imageFile = null;
    userId = null;
  }

  @override
  bool operator ==(covariant IntroductionPageModel other) {
    if (identical(this, other)) return true;

    return other.imageFile == imageFile;
  }

  @override
  int get hashCode => imageFile.hashCode;
}
