import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants/global_variables.dart';
import '../controller/controller_profile_page.dart';

class ChangePictureAvatar extends StatefulWidget {
  const ChangePictureAvatar({super.key});

  @override
  State<ChangePictureAvatar> createState() => _ChangePictureAvatarState();
}

class _ChangePictureAvatarState extends State<ChangePictureAvatar> {
  final controller = ControllerProfilePage();
  User currentUser = FirebaseAuth.instance.currentUser!;
  File? imageFilePick;

  String urlImage = '';

  Future<String> getImageUrl(String uid) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return data['image'];
  }

  @override
  void initState() {
    getImageUrl(currentUser.uid).then((value) => setState(() {
          urlImage = value;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 270,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          imageFilePick != null
              ? ClipOval(
                  child: Image.file(
                    imageFilePick!,
                    cacheHeight: 100,
                    cacheWidth: 100,
                  ),
                )
              : ClipOval(
                  child: CachedNetworkImage(
                    width: 100,
                    height: 100,
                    imageUrl: urlImage,
                    errorWidget: (context, url, error) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          'assets/img/user_default.jpg',
                          width: 100,
                          height: 100,
                        ),
                      );
                    },
                  ),
                ),
          const Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  controller.pickImage(ImageSource.camera).then(
                        (value) => setState(() {
                          imageFilePick = value;
                        }),
                      );
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        GloblalVariable.hex_f94f2f.withOpacity(0.8))),
                child: const Text(
                  'Pick from camera',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
              const Gap(15),
              TextButton(
                onPressed: () {
                  controller.pickImage(ImageSource.gallery).then(
                        (value) => setState(() {
                          imageFilePick = value;
                        }),
                      );
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        GloblalVariable.hex_f94f2f.withOpacity(0.8))),
                child: const Text(
                  'Pick from gallery',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              controller.pushUserImage(currentUser.uid).then((_) {
                context.pop();
              });
            },
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green)),
            child: const Text(
              'Done',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
