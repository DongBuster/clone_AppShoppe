import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ControllerProfilePage {
  User? currentUser = FirebaseAuth.instance.currentUser;

  File? imageFile;

  Future<File?> pickImage(ImageSource imageSource) async {
    try {
      final imageFilePick = await ImagePicker().pickImage(source: imageSource);
      if (imageFilePick == null) return null;
      final imageTemporary = File(imageFilePick.path);
      // final imagePermanent = await saveImagePermanently(image.path);

      imageFile = imageTemporary;
      return imageFile;
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
    return null;
  }

  Future<void> pushUserImage(String userId) async {
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

  Future<String?> getNameUser() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .get();

    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return data['name'];
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
