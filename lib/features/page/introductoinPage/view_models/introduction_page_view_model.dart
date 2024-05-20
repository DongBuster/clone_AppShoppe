import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../models/introduction_page_model.dart';

class IntroductionPageViewModel extends ChangeNotifier {
  IntroductionPageModel stateIntroductionPage = IntroductionPageModel.itinial();

  //----- business logic -----

  Future<void> pushUserImage(String userId, BuildContext context) async {
    // print(imageFile);
    //--- create file name ---
    final imageName = '${userId}_image_user';
    // --- create StorageRef ---
    final firebaseStorageRef =
        FirebaseStorage.instance.ref().child('image_users/$userId/$imageName');
    // --- upload image ---
    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
    );

    final uploadTask =
        firebaseStorageRef.putFile(stateIntroductionPage.imageFile!, metadata);
    await uploadTask.then((task) {
      task.ref.getDownloadURL().then((urlImage) async {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .update({'image': urlImage});
      });
    });
    // print(urlImage);
  }

  Future<void> updateNameUser(String name) async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    // print(user.uid??'');
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .update({'name': name});
  }

  Future setIsNewUser(String userId) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({'isNewUser': 'false'});
  }

  Future<String> getImageUrlStream() {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return Future.value('');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .get()
        .then((result) {
      Map<String, dynamic> data = result.data() as Map<String, dynamic>;
      if (data['image'] == 'null') {
        return '';
      } else {
        return data['image'];
      }
    });
  }

  //----- state -----

  Future pickImage(ImageSource imageSource) async {
    try {
      final imageFilePick = await ImagePicker().pickImage(source: imageSource);
      if (imageFilePick == null) {
        stateIntroductionPage.imageFile = null;
        notifyListeners();
        return;
      }
      final imageTemporary = File(imageFilePick.path);
      // final imagePermanent = await saveImagePermanently(image.path);

      stateIntroductionPage.imageFile = imageTemporary;
      notifyListeners();
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  void setImageFile(File? file) {
    stateIntroductionPage.imageFile = file;
    notifyListeners();
  }

  void setUserId(String id) {
    stateIntroductionPage.userId = id;
    notifyListeners();
  }
}
