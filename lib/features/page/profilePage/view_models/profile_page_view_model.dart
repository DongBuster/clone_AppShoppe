import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../models/profile_page_model.dart';

class ProfilePageViewModel extends ChangeNotifier {
  ProfilePageModel stateProfilePage = ProfilePageModel.itinial();

  Future pickImage(ImageSource imageSource) async {
    try {
      final imageFilePick = await ImagePicker().pickImage(source: imageSource);
      if (imageFilePick == null) {
        stateProfilePage.imageFile = null;
        notifyListeners();
        return;
      }
      final imageTemporary = File(imageFilePick.path);
      // final imagePermanent = await saveImagePermanently(image.path);

      stateProfilePage.imageFile = imageTemporary;
      notifyListeners();
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
    return null;
  }

  Future<void> pushUserImage() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    //--- create file name ---
    final imageName = '${currentUser!.uid}_image_user';
    // --- create StorageRef ---
    final firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('image_users/$currentUser!.uid/$imageName');
    // --- upload image ---
    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
    );

    final uploadTask =
        firebaseStorageRef.putFile(stateProfilePage.imageFile!, metadata);
    await uploadTask.then((task) {
      task.ref.getDownloadURL().then((urlImage) async {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .update({'image': urlImage});
      });
    });
    // print(urlImage);
  }

  Future<String?> getNameUser() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .get();

      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      return data['name'];
    } catch (e) {
      return '';
    }
  }

  Future<String> getImageUrlFuture() {
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

  Stream<String> getImageUrlStream() {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return Stream.value('');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .snapshots()
        .map((snapshot) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      if (data['image'] == 'null') {
        return '';
      } else {
        return data['image'];
      }
    });
  }
}
