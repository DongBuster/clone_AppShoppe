import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:clone_shoppe/constants/global_variables.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  final controller = TextEditingController();
  final focusNode = FocusNode();

  File? image;
  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  Future pickImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;
      final imageTemporary = File(image.path);
      // final imagePermanent = await saveImagePermanently(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  // Future<File> saveImagePermanently(String imagePath) async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final name = basename(imagePath);
  //   final permanentImagePath = '${directory.path}/$name';

  //   File image = File(imagePath);
  //   File permanentImage = await image.copy(permanentImagePath);
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('imagePath', permanentImage.path);
  //   // print(permanentImage.path);
  //   return permanentImage;
  // }

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
        key: introKey,
        globalBackgroundColor: Colors.white,
        allowImplicitScrolling: true,
        infiniteAutoScroll: false,

        pages: [
          PageViewModel(
            title: '',
            bodyWidget: Image.asset(
              'assets/img/intro_welcome.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "",
            bodyWidget: Image.asset(
              'assets/img/intro_hello.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
            ),
            footer: Column(
              children: [
                const Gap(30),
                Text(
                  'Can you tell me your name?',
                  style: TextStyle(
                      fontSize: 20,
                      color: GloblalVariable.hex_f94f2f.withOpacity(0.8)),
                ),
                const Gap(10),
                SizedBox(
                  height: 30,
                  width: 100,
                  child: TextField(
                    controller: controller,
                    focusNode: focusNode,
                    onTapOutside: (event) {
                      focusNode.unfocus();
                    },
                    cursorColor: Colors.blue,
                    cursorWidth: 2,
                    decoration: const InputDecoration(
                      hintText: 'Type your name',
                      hintStyle: TextStyle(fontSize: 13, color: Colors.black45),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: GloblalVariable.hex_f94f2f),
                      ),
                    ),
                  ),
                )
              ],
            ),
            decoration: const PageDecoration(
              pageColor: Colors.white,
              imagePadding: EdgeInsets.zero,
            ),
          ),
          PageViewModel(
            title: "Choose your profile picture",
            bodyWidget: Column(
              children: [
                image != null
                    ? ClipOval(
                        child: Image.file(
                        image!,
                        cacheHeight: 180,
                        cacheWidth: 180,
                      ))
                    : ClipRRect(
                        child: Image.asset('assets/img/user_default.jpg',
                            width: 180, height: 180),
                      ),
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => pickImage(ImageSource.camera),
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              GloblalVariable.hex_f94f2f)),
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
                      onPressed: () => pickImage(ImageSource.gallery),
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              GloblalVariable.hex_f94f2f)),
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
                )
              ],
            ),
            decoration: const PageDecoration(
              titlePadding: EdgeInsets.only(top: 30),
              bodyPadding: EdgeInsets.fromLTRB(12.0, 30.0, 12.0, 12.0),
              pageColor: Colors.white,
              imagePadding: EdgeInsets.zero,
            ),
          ),
        ],
        onDone: () => context.pushNamed(GloblalVariable.homeScreen),
        onSkip: () => context.pushNamed(
          GloblalVariable.homeScreen,
        ),
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
