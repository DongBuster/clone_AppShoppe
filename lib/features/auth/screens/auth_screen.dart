import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/global_variables.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/background.jpg'),
              fit: BoxFit.fill)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ----- header -----
          const SizedBox(height: 50),
          const Text('Amazon',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                  decoration: TextDecoration.none)),
          const SizedBox(height: 80),
          // ------ body --------
          const Expanded(
            child: Center(
              child: Text('Wellcome',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.none)),
            ),
          ),
          // -------- footer --------
          Column(
            children: [
              const Text('Do you want to something ?',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      decoration: TextDecoration.none)),
              // --------
              const SizedBox(height: 10),
              Container(
                constraints: const BoxConstraints(maxWidth: 330),
                child: const Text(
                    'Everything you want is here! Just click what you want and it will be right in front of you',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white54,
                        decoration: TextDecoration.none)),
              ),

              const SizedBox(height: 90),
              // -------- button login ------
              GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pushNamed(GloblalVariable.loginScreen);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white),
                    child: const Text('Log In',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            decoration: TextDecoration.none)),
                  )),
              const SizedBox(height: 20),
              // ------ button sign up ------
              GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .pushNamed(GloblalVariable.registerScreen);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.blue),
                    child: const Text('Sign up',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            decoration: TextDecoration.none)),
                  )),

              const SizedBox(height: 60),
            ],
          )
        ],
      ),
    );
  }
}
