import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../services/service_loginWithAccout.dart';

import '../../../constants/global_variables.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // ------- variables form ------
  final _formKey = GlobalKey<FormState>();

  // -------- variables for handling password -------
  late String _password;
  bool _passwordVisible = false;

  // ---- variables for form controller -------

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // ----- handle validate email --------
  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    if (!regex.hasMatch(value!)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // ---- widget passwordVisiable ------

  Widget passwordVisiable() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _passwordVisible = !_passwordVisible;
        });
      },
      child: Icon(_passwordVisible ? Icons.visibility_off : Icons.visibility,
          size: 20, color: GloblalVariable.hex_9c9c9c),
    );
  }

  // ------- handle click button register ------

  void signUpAccount() {
    loginWithAccount.signUpAccount(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
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
                  GoRouter.of(context).pushNamed(GloblalVariable.loginScreen);
                },
                icon: const Icon(Icons.arrow_back_ios,
                    size: 22, color: Colors.white),
              ),
            ),
            // ------ title ------
            const Expanded(
              child: Center(
                child: Text(
                  'Create account',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.none),
                ),
              ),
            ),
            // ----- input fields ------
            Form(
              key: _formKey,
              child: SizedBox(
                height: 370,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ------ field username ------
                    Expanded(
                      child: CustomTextField(
                        controller: _nameController,
                        width: 300,
                        height: 50,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some name';
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
                        hintText: 'Name',
                      ),
                    ),
                    // ------- field email ---------
                    Expanded(
                      child: CustomTextField(
                        controller: _emailController,
                        width: 300,
                        height: 50,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          return validateEmail(value);
                        },
                        cursorColor: Colors.blue,
                        fillColor: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        passwordVisible: null,
                        suffixIcon: const SizedBox(),
                        prefixIcon: const Icon(Icons.mail,
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
                            return 'Please enter password';
                          } else {
                            setState(() {
                              _password = value;
                            });
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
                        suffixIcon: passwordVisiable(),
                      ),
                    ),
                    // ------ field confirm passwords ------
                    Expanded(
                      child: CustomTextField(
                        controller: null,
                        width: 300,
                        height: 50,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          } else if (value != _password) {
                            return 'Passwords don\'t match';
                          }
                          return null;
                        },
                        cursorColor: Colors.blue,
                        fillColor: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        passwordVisible: _passwordVisible,
                        prefixIcon: const Icon(Icons.lock,
                            size: 20, color: GloblalVariable.hex_9c9c9c),
                        hintText: 'Confirm password',
                        suffixIcon: passwordVisiable(),
                      ),
                    ),

                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
            // ------ sign up -------
            GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Terms and Service'),
                          content: const Text(
                            'Các điều khoản này có thể bao gồm các \n'
                            'quy định về bảo mật, quyền sở hữu trí \n'
                            'tuệ, quyền riêng tư, quy định về nội \n'
                            'dung và hành vi không được phép trên ứng dụng\n',
                          ),
                          actions: <Widget>[
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge,
                              ),
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge,
                              ),
                              child: const Text('Appect'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                signUpAccount();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.blue),
                  child: const Text('Sign up',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.none)),
                )),
            const SizedBox(height: 90),
            // ------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Do have an account ? ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.none)),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pushNamed(GloblalVariable.loginScreen);
                  },
                  child: const Text('Login now',
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
