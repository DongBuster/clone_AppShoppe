import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../constants/global_variables.dart';
import '../controller/controller.dart';
import '../provider/state_introduction_page.dart';

class ScreenThird extends StatefulWidget {
  const ScreenThird({super.key});

  @override
  State<ScreenThird> createState() => _ScreenThirdState();
}

class _ScreenThirdState extends State<ScreenThird> {
  final controller = ControllerIntruductionPage();

  @override
  Widget build(BuildContext context) {
    return Consumer<StateIntroductionPage>(
      builder: (context, state, child) {
        File? imagePick = state.introductionPageModel.getImageFile;
        return Column(
          children: [
            imagePick != null
                ? ClipOval(
                    child: Image.file(
                      imagePick,
                      cacheHeight: 180,
                      cacheWidth: 180,
                    ),
                  )
                : StreamBuilder(
                    stream: controller.getImageUrlStream(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return ClipOval(
                          child: Image.file(
                            imagePick!,
                            cacheHeight: 180,
                            cacheWidth: 180,
                          ),
                        );
                      }
                      if (snapshot.hasData) {
                        return ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: snapshot.data!,
                            height: 180,
                            width: 180,
                            placeholderFadeInDuration:
                                const Duration(seconds: 1),
                          ),
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
            const Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () async {
                    await controller
                        .pickImage(ImageSource.camera)
                        .then((value) {
                      state.setImageFile(value!);
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          GloblalVariable.hex_f94f2f.withOpacity(0.8))),
                  child: const Text(
                    'Pick from camera',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Gap(15),
                TextButton(
                  onPressed: () async {
                    await controller
                        .pickImage(ImageSource.gallery)
                        .then((value) {
                      state.setImageFile(value!);
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          GloblalVariable.hex_f94f2f.withOpacity(0.8))),
                  child: const Text(
                    'Pick from gallery',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
