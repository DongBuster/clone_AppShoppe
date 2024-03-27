import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:go_router/go_router.dart';
import '../controller/auth_controller.dart';
import '../widget/input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAccout = false;

  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(microseconds: 1000));
  }

  final _controllerUsername = TextEditingController();
  final _focusNodeUsername = FocusNode();
  final _controllerPassword = TextEditingController();
  final _focusNodePassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UsernameFied(
                  title: 'Username',
                  hintText: 'Type your username or email',
                  prefixIcon: const Icon(
                    Icons.person_2_outlined,
                    size: 20,
                    color: Colors.black38,
                  ),
                  controller: _controllerUsername,
                  focusNode: _focusNodeUsername,
                ),
                const Gap(20),
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
                  onTap: () {
                    AuthController.signInWithEmailAndPassword(
                            context, _controllerUsername, _controllerPassword)
                        .then((value) =>
                            context.goNamed(GloblalVariable.introductionPage));
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
                        AuthController.handleGoogleBtnClick(context).then(
                            (value) => context
                                .goNamed(GloblalVariable.introductionPage));
                      },
                      icon: SvgPicture.asset(
                        'assets/icon_google.svg',
                        width: 18,
                        height: 18,
                      ),
                    ),
                  ],
                ),
                const Gap(40),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    '👉 Or Go to Register!',
                    textStyle: const TextStyle(
                      fontSize: 14,
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
                  context.go('/register');
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
