import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common/widgets/loading.dart';
import 'view_models/introduction_page_view_model.dart';
import 'views/screen_first.dart';
import 'views/screen_second.dart';
import 'views/screen_third.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({
    super.key,
  });

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
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

    String? userId =
        Provider.of<IntroductionPageViewModel>(context, listen: true)
            .stateIntroductionPage
            .userId;
    // print('state $userId');

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
            bodyWidget: const ScreenSecond(),
            decoration: const PageDecoration(
              pageColor: Colors.white,
              imagePadding: EdgeInsets.zero,
            ),
          ),
          PageViewModel(
            title: "Choose your profile picture",
            bodyWidget: const ScreenThird(),
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
          IntroductionPageViewModel viewModel =
              Provider.of<IntroductionPageViewModel>(context, listen: false);
          //--- loading ----
          OverlayState overlayState = Overlay.of(context);
          OverlayEntry overlayEntry = OverlayEntry(
            builder: (context) {
              return const Loading();
            },
          );
          overlayState.insert(overlayEntry);

          //---- ----
          if (viewModel.stateIntroductionPage.imageFile != null) {
            await viewModel.pushUserImage(userId!, context).then((_) {
              viewModel.setIsNewUser(userId);
              overlayEntry.remove();

              context.pushReplacementNamed(GloblalVariable.homeScreen);
            });
          } else {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();

            viewModel.setIsNewUser(userId!);
            overlayEntry.remove();

            if (context.mounted) {
              context.pushReplacementNamed(GloblalVariable.homeScreen);
            }
            prefs.setBool('islogin', true);
            // prefs.setString('email', controllerUsername.text);
          }
        },
        onSkip: () async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          if (context.mounted) {
            context.pushReplacementNamed(GloblalVariable.homeScreen);
          }
          prefs.setBool('islogin', true);
        },
        resizeToAvoidBottomInset: false,
        showSkipButton: true,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: false,
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
