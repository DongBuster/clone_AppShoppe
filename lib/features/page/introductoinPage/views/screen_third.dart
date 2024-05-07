import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants/global_variables.dart';
import '../controller/controller.dart';

class ScreenThird extends StatefulWidget {
  File? imageFilePick;

  ScreenThird({super.key, required this.imageFilePick});

  @override
  State<ScreenThird> createState() => _ScreenThirdState();
}

class _ScreenThirdState extends State<ScreenThird> {
  final controller = ControllerIntruductionPage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.imageFilePick != null
            ? ClipOval(
                child: Image.file(
                  widget.imageFilePick!,
                  cacheHeight: 180,
                  cacheWidth: 180,
                ),
              )
            : ClipRRect(
                child: Image.asset('assets/img/user_default.jpg',
                    width: 180, height: 180),
              ),
        const Gap(30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                controller.pickImage(ImageSource.camera).then(
                      (value) => setState(() {
                        widget.imageFilePick = value;
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
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
            const Gap(15),
            TextButton(
              onPressed: () {
                controller.pickImage(ImageSource.gallery).then(
                      (value) => setState(() {
                        widget.imageFilePick = value;
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
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
