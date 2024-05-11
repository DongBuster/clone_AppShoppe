import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ControllerIntruductionPage {
  File? imageFile;

  Future<File?> pickImage(ImageSource imageSource) async {
    try {
      final imageFilePick = await ImagePicker().pickImage(source: imageSource);
      if (imageFilePick == null) return null;
      final imageTemporary = File(imageFilePick.path);
      // final imagePermanent = await saveImagePermanently(image.path);

      imageFile = imageTemporary;
      print(imageFile);
      return imageFile;
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
    return null;
  }

  Future<void> pushUserImage(String userId) async {
    // print(imageFile);

    // print(imageFilePick ?? 'file null');
    //--- create file name ---
    final imageName = '${userId}_image_user';
    // --- create StorageRef ---
    final firebaseStorageRef =
        FirebaseStorage.instance.ref().child('image_users/$userId/$imageName');
    // --- upload image ---
    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
    );

    final uploadTask = firebaseStorageRef.putFile(imageFile!, metadata);
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

  Future<void> updateNameUser(String name, String userId) async {
    // print(user.uid??'');
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({'name': name});
  }

  Future setIsNewUser(String userId) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({'isNewUser': 'false'});
  }
}
