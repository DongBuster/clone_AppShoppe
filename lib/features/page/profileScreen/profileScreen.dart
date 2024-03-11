import 'package:clone_shoppe/constants/SnackBar.dart';
import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:clone_shoppe/features/auth/services/service_loginWithAccout.dart';
import 'package:clone_shoppe/features/auth/services/service_loginWithGoogle.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

String? getUsernameFromCurrentUser() {
  if (_googleSignIn.currentUser != null) {
    String? username = _googleSignIn.currentUser!.displayName;
    return username;
  } else {
    return null;
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? username = getUsernameFromCurrentUser();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.blue,
              padding: const EdgeInsets.all(16.0),
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () async {
              loginWithAccount.logOut();
              LoginWithGoogle.logOut();
              if (mounted) {
                context.goNamed(GloblalVariable.authScreen);
              } else {
                showSnackBar(context, 'Something went wrong, please try again');
              }
            },
            child: const Text(
              'logout',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
        Text(
          username != null ? 'Username: $username' : 'error',
          style: const TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}
