import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../constants/global_variables.dart';
import '../view_models/introduction_page_view_model.dart';

class ScreenThird extends StatefulWidget {
  const ScreenThird({super.key});

  @override
  State<ScreenThird> createState() => _ScreenThirdState();
}

class _ScreenThirdState extends State<ScreenThird> {
  @override
  Widget build(BuildContext context) {
    return Consumer<IntroductionPageViewModel>(
      builder: (context, viewModel, child) {
        File? imagePick = viewModel.stateIntroductionPage.imageFile;
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
                : FutureBuilder(
                    future: viewModel.getImageUrlStream(),
                    builder: (context, snapshot) {
                      // print(snapshot.data);
                      if (snapshot.hasError) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            'assets/img/user_default.jpg',
                            width: 180,
                            height: 180,
                          ),
                        );
                      }
                      if (snapshot.hasData) {
                        return ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: snapshot.data ?? '',
                            height: 180,
                            width: 180,
                            placeholderFadeInDuration:
                                const Duration(seconds: 1),
                            errorWidget: (context, url, error) => ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                'assets/img/user_default.jpg',
                                width: 180,
                                height: 180,
                              ),
                            ),
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
                    await viewModel.pickImage(ImageSource.camera);
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
                    await viewModel.pickImage(ImageSource.gallery);
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
