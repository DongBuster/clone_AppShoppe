import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:go_router/go_router.dart';
import '../../../common/widgets/loading.dart';
import '../controller/auth_controller.dart';
import '../widgets/input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controllerUsername = TextEditingController();
  final _focusNodeUsername = FocusNode();
  final _controllerPassword = TextEditingController();
  final _focusNodePassword = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(microseconds: 1000));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Center(
                // padding: EdgeInsets.only(top: 50),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      UsernameFied(
                        title: 'Email',
                        hintText: 'Type your email',
                        prefixIcon: const Icon(
                          Icons.person_2_outlined,
                          size: 20,
                          color: Colors.black38,
                        ),
                        controller: _controllerUsername,
                        focusNode: _focusNodeUsername,
                      ),
                      // const Gap(20),
                      PasswordFieldLoginPage(
                        title: 'Password',
                        hintText: 'Type your password',
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          size: 20,
                          color: Colors.black38,
                        ),
                        controller: _controllerPassword,
                        focusNode: _focusNodePassword,
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                Container(
                  alignment: Alignment.centerRight,
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const Gap(25),
                //-- button login
                GestureDetector(
                  onTap: () async {
                    OverlayState overlayState = Overlay.of(context);
                    OverlayEntry overlayEntry = OverlayEntry(
                      builder: (context) {
                        return const Loading();
                      },
                    );
                    if (_formKey.currentState!.validate()) {
                      overlayState.insert(overlayEntry);
                      await AuthController.signInWithEmailAndPassword(
                              context, _controllerUsername, _controllerPassword)
                          .then((value) {
                        overlayEntry.remove();
                      });
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width - 70,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Colors.blue,
                          Colors.purpleAccent,
                        ],
                      ),
                    ),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const Gap(40),
                const Text(
                  'Or Sign Up Using',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.filled(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                        side: MaterialStatePropertyAll(
                          BorderSide(
                            color: Color(0xff03a9f4),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.facebook,
                        size: 18,
                        color: Colors.blue,
                      ),
                    ),
                    IconButton.filled(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                        side: MaterialStatePropertyAll(
                          BorderSide(
                            color: Color(0xffff5d40),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icon_instagram.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    IconButton.filled(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                        side: MaterialStatePropertyAll(
                          BorderSide(
                            color: Color(0xff03a9f4),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icon_twitter.svg',
                        width: 18,
                        height: 18,
                      ),
                    ),
                    IconButton.filled(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                        side: MaterialStatePropertyAll(
                          BorderSide(
                            color: Color(0xff4caf50),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text('Loading...'),
                          backgroundColor: Colors.black.withOpacity(0.5),
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height / 2,
                            right: 120,
                            left: 120,
                          ),
                        ));
                        await AuthController.handleGoogleBtnClick(context)
                            .whenComplete(() => ScaffoldMessenger.of(context)
                                .hideCurrentSnackBar());
                        // if (context.mounted) {
                        //
                        // }
                      },
                      icon: SvgPicture.asset(
                        'assets/icon_google.svg',
                        width: 18,
                        height: 18,
                      ),
                    ),
                  ],
                ),
                const Gap(80),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    '👉 Or Go to Register!',
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    colors: [
                      Colors.blue,
                      Colors.red,
                      Colors.purpleAccent,
                    ],
                    textAlign: TextAlign.center,
                    speed: const Duration(milliseconds: 500),
                  ),
                ],
                onTap: () {
                  context.goNamed(GloblalVariable.registerScreen);
                },
                repeatForever: true,
                pause: const Duration(milliseconds: 500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
