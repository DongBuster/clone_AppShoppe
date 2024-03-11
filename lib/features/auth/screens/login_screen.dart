import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/widgets/custom_textfield.dart';
import '../../../constants/SnackBar.dart';
import '../../../constants/global_variables.dart';
import '../services/service_loginWithGoogle.dart';
import '../services/service_loginWithAccout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  // ---- variables for form controller -------

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // ---- handle click button login --------
  void signInAccount() {
    loginWithAccount.signInAccount(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(GloblalVariable.backgroundImageAuth),
              fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ------ button back ------
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                onPressed: () {
                  GoRouter.of(context).pushNamed(GloblalVariable.authScreen);
                },
                icon: const Icon(Icons.arrow_back_ios,
                    size: 22, color: Colors.white),
              ),
            ),
            // ------ title ------
            const Expanded(
              child: Center(
                child: Text(
                  'Wellcome back',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.none),
                ),
              ),
            ),
            // ----- input fields --------
            Form(
              key: _formKey,
              child: SizedBox(
                height: 160,
                child: Column(
                  children: [
                    // ------ field email ------
                    Expanded(
                      child: CustomTextField(
                        controller: _emailController,
                        width: 300,
                        height: 50,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a username';
                          }
                          return null;
                        },
                        cursorColor: Colors.blue,
                        fillColor: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        passwordVisible: null,
                        suffixIcon: const SizedBox(),
                        prefixIcon: const Icon(Icons.person,
                            color: GloblalVariable.hex_9c9c9c),
                        hintText: 'Email',
                      ),
                    ),
                    // ------ field passwords ------
                    Expanded(
                      child: CustomTextField(
                        controller: _passwordController,
                        width: 300,
                        height: 50,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        cursorColor: Colors.blue,
                        fillColor: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        passwordVisible: _passwordVisible,
                        prefixIcon: const Icon(Icons.lock,
                            size: 20, color: GloblalVariable.hex_9c9c9c),
                        hintText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          child: Icon(
                              _passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 20,
                              color: GloblalVariable.hex_9c9c9c),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // ----- forgot password -----
            Padding(
              padding: const EdgeInsets.only(right: 35),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: null,
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // ------ button login-----
            GestureDetector(
                onTap: () {
                  context.goNamed(GloblalVariable.homeScreen);
                  // if (_formKey.currentState!.validate()) {
                  //   signInAccount();
                  // }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.blue),
                  child: const Text('Log In',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.none)),
                )),
            const SizedBox(height: 20),
            // --------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 110,
                  height: 2,
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(color: GloblalVariable.hex_9c9c9c))),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Text('or',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                Container(
                  width: 110,
                  height: 2,
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(color: GloblalVariable.hex_9c9c9c))),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // ------ other button login-----
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextButton.icon(
                    onPressed: () {
                      // await LoginWithFacebook.login();
                      // if (context.mounted) {
                      //   context.goNamed(GloblalVariable.homeScreen);
                      // } else {
                      showSnackBar(
                          context, 'Something is wrong, please try again');
                      // }
                    },
                    icon:
                        const Icon(Icons.facebook_outlined, color: Colors.blue),
                    label: const Text('Login',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            decoration: TextDecoration.none)),
                  ),
                ),
                const SizedBox(width: 30),
                Container(
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextButton.icon(
                    onPressed: () async {
                      await LoginWithGoogle.SignInWithGoogle();

                      // ignore: use_build_context_synchronously
                      if (mounted) {
                        context.goNamed(GloblalVariable.homeScreen);
                      } else {
                        showSnackBar(
                            context, 'Something is wrong, please try again');
                      }
                    },
                    icon: Image.asset(
                      'assets/img/google.png',
                      width: 15,
                      height: 15,
                    ),
                    label: const Text('Login',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            decoration: TextDecoration.none)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 90),
            // ------ sign up -------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Do not have an account ? ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.none)),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .pushNamed(GloblalVariable.registerScreen);
                  },
                  child: const Text('Register now',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          decoration: TextDecoration.none)),
                )
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
