import 'dart:io';
import 'package:clone_shoppe/features/page/introductoinPage/provider/state_introduction_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ControllerIntruductionPage {
  User? currentUser = FirebaseAuth.instance.currentUser;

  File? imageFile;

  Future<File?> pickImage(ImageSource imageSource) async {
    try {
      final imageFilePick = await ImagePicker().pickImage(source: imageSource);
      if (imageFilePick == null) return null;
      final imageTemporary = File(imageFilePick.path);
      // final imagePermanent = await saveImagePermanently(image.path);

      imageFile = imageTemporary;
      // print(imageFile);
      return imageFile;
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
    return null;
  }

  Future<void> pushUserImage(String userId, BuildContext context) async {
    File imageFile = Provider.of<StateIntroductionPage>(context, listen: false)
        .introductionPageModel
        .getImageFile;
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

    final uploadTask = firebaseStorageRef.putFile(imageFile, metadata);
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

  Stream<String> getImageUrlStream() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .snapshots()
        .map((snapshot) {
      if (snapshot.data() == null) {
        return '';
      } else {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        return data['image'];
      }
    });
  }
}
