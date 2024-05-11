import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:clone_shoppe/constants/global_variables.dart';
import 'InheritedWidget/introduction_inherited_data.dart';
import 'controller/controller.dart';
import 'views/screen_first.dart';
import 'views/screen_second.dart';
import 'views/screen_third.dart';

class IntroductionPage extends StatefulWidget {
  final String userId;
  const IntroductionPage({
    super.key,
    required this.userId,
  });

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final controller = ControllerIntruductionPage();

  File? imageFilePick;

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        allowImplicitScrolling: true,
        infiniteAutoScroll: false,

        pages: [
          PageViewModel(
            title: '',
            bodyWidget: const ScreenFirst(),
            decoration: pageDecoration,
          ),
          PageViewModel(
            useScrollView: true,
            title: "",
            bodyWidget: ScreenSecond(userId: widget.userId),
            decoration: const PageDecoration(
              pageColor: Colors.white,
              imagePadding: EdgeInsets.zero,
            ),
          ),
          PageViewModel(
            title: "Choose your profile picture",
            bodyWidget: Column(
              children: [
                imageFilePick != null
                    ? ClipOval(
                        child: Image.file(
                          imageFilePick!,
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
                        controller
                            .pickImage(
                              ImageSource.camera,
                            )
                            .then((value) => setState(() {
                                  imageFilePick = value;
                                }));
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
                        controller
                            .pickImage(
                              ImageSource.gallery,
                            )
                            .then((value) => setState(() {
                                  imageFilePick = value;
                                }));
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
            ),
            decoration: const PageDecoration(
              bodyAlignment: Alignment.center,
              titlePadding: EdgeInsets.only(top: 30),
              bodyPadding: EdgeInsets.fromLTRB(12.0, 30.0, 12.0, 12.0),
              pageColor: Colors.white,
              imagePadding: EdgeInsets.zero,
            ),
          ),
        ],
        onDone: () async {
          await controller.pushUserImage(widget.userId).then((_) {
            controller.setIsNewUser(widget.userId);
            context.pushNamed(GloblalVariable.homeScreen);
          });
        },
        onSkip: () => context.pushNamed(GloblalVariable.homeScreen),

        resizeToAvoidBottomInset: false,
        showSkipButton: true,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: false,
        //rtl: true, // Display as right-to-left
        back: const Icon(Icons.arrow_back),
        skip: const Text(
          'Skip',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: GloblalVariable.hex_f94f2f,
          ),
        ),
        next: const Icon(
          Icons.arrow_forward,
          color: GloblalVariable.hex_f94f2f,
        ),
        done: const Text(
          'Done',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: GloblalVariable.hex_f94f2f,
          ),
        ),

        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),

        dotsDecorator: const DotsDecorator(
          size: Size(8.0, 8.0),
          color: GloblalVariable.hex_9c9c9c,
          activeSize: Size(15.0, 8.0),
          activeColor: GloblalVariable.hex_f94f2f,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}

final snackBar = SnackBar(
  backgroundColor: Colors.green.shade400,
  content: const Text(
    'Sucessfully',
    style: TextStyle(color: Colors.white),
  ),
  duration: const Duration(milliseconds: 500),
);
