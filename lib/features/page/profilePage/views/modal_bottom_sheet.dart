import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../constants/global_variables.dart';
import '../view_models/profile_page_view_model.dart';

class ChangePictureAvatar extends StatefulWidget {
  const ChangePictureAvatar({super.key});

  @override
  State<ChangePictureAvatar> createState() => _ChangePictureAvatarState();
}

class _ChangePictureAvatarState extends State<ChangePictureAvatar> {
  User currentUser = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfilePageViewModel>(
      builder: (context, viewModel, child) {
        File? imageFilePick = viewModel.stateProfilePage.imageFile;
        return Container(
          padding: const EdgeInsets.all(15),
          height: 270,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              imageFilePick != null
                  ? ClipOval(
                      child: Image.file(
                        imageFilePick,
                        cacheHeight: 100,
                        cacheWidth: 100,
                      ),
                    )
                  : FutureBuilder<String>(
                      future: viewModel.getImageUrlFuture(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ClipOval(
                            child: CachedNetworkImage(
                              width: 100,
                              height: 100,
                              imageUrl: snapshot.data!,
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
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      viewModel.pickImage(ImageSource.camera).then(
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
                      viewModel.pickImage(ImageSource.gallery).then(
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
                  viewModel.pushUserImage().then((_) {
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
      },
    );
  }
}
