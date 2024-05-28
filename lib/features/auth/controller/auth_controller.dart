import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clone_shoppe/constants/global_variables.dart';
import 'package:clone_shoppe/features/page/introductionPage/introduction_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/user.dart';
import '../../page/introductionPage/view_models/introduction_page_view_model.dart';
import '../services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static User get user => auth.currentUser!;
  static FirebaseAuth auth = FirebaseAuth.instance;
  // --- login accout google
  static Future<UserCredential> _signInWithGoogle() async {
    // Trigger the authentication flow

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await auth.signInWithCredential(credential);
  }

  static Future<void> createUser(String email, String id) async {
    String nameUser = email.toString();
    int splitIndex = nameUser.indexOf('@');
    nameUser = nameUser.substring(0, splitIndex);
    final accountUser = AccoutUser(
      id: id,
      name: nameUser,
      image: user.photoURL.toString(),
      email: user.email.toString(),
      isNewUser: 'true',
    );

    await firestore.collection('users').doc(user.uid).set(accountUser.toJson());
  }

  static Future<String> isNewUser(String userId) async {
    final DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (snapshot.exists && snapshot.data() != null) {
      final data = snapshot.data() as Map<String, dynamic>;
      final isNewUser = data['isNewUser'];
      return isNewUser;
    } else {
      return '';
    }
  }

  static Future<void> handleGoogleBtnClick(BuildContext context) async {
    _signInWithGoogle().then((userLogin) async {
      // print(userLogin);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('islogin', true);

      await prefs.setString('email', userLogin.user!.email!);
      isNewUser(userLogin.user!.uid).then((isNewUser) async {
        if (isNewUser == 'true') {
          Provider.of<IntroductionPageViewModel>(context, listen: false)
              .setUserId(userLogin.user!.uid);
          context.goNamed(GloblalVariable.introductionPage);
        } else if (isNewUser == 'false') {
          if (context.mounted) {
            context.goNamed(GloblalVariable.homeScreen);
          }
        } else {
          createUser(userLogin.user!.email!, userLogin.user!.uid);
          Provider.of<IntroductionPageViewModel>(context, listen: false)
              .setUserId(userLogin.user!.uid);
          context.goNamed(GloblalVariable.introductionPage);
        }
      });
    }).catchError((error) {
      debugPrint('Login accout google error:$error');
      ScaffoldMessenger.of(context).showSnackBar(snackBarErrorOccurred);
    });
  }

  // --- sign in email  and password
  static Future<void> signInWithEmailAndPassword(
    BuildContext context,
    TextEditingController controllerUsername,
    TextEditingController controllerPassword,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await Auth()
          .signInWithEmailAndPassword(
        email: controllerUsername.text,
        password: controllerPassword.text,
      )
          .then(
        (user) {
          // print('return user fjsd: $user');
          Provider.of<IntroductionPageViewModel>(context, listen: false)
              .setUserId(user!.uid);
          isNewUser(user.uid).then(
            (isNewUser) {
              // print(isNewUser);
              // print('auth ${user.uid}');
              if (isNewUser == 'true') {
                context.goNamed(GloblalVariable.introductionPage);
              } else {
                context.goNamed(GloblalVariable.homeScreen);
                prefs.setBool('islogin', true);
                prefs.setString('email', controllerUsername.text);
              }
            },
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      debugPrint('here kk: ${e.message}');
      if (e.message == 'The email address is badly formatted') {
        // print('asjd');
        ScaffoldMessenger.of(context).showSnackBar(snackBarErrorFormatEmail);
      }
    }
  }

  // ---- create user

  static Future<void> createUserWithEmailAndPassword(
    BuildContext context,
    TextEditingController controllerUsername,
    TextEditingController controllerPassword,
  ) async {
    try {
      await Auth()
          .createUserWithEmailAndPassword(
        email: controllerUsername.text,
        password: controllerPassword.text,
      )
          .then(
        (value) {
          createUser(controllerUsername.text, user.uid);
          context.goNamed(GloblalVariable.loginScreen);
        },
      );
    } on FirebaseAuthException catch (e) {
      debugPrint('ERROR-createUserWithEmailAndPassword:${e.message}');
      if (e.message ==
          'The email address is already in use by another account.') {
        ScaffoldMessenger.of(context).showSnackBar(snackbarUsedEmail);
      }
      if (e.message == 'Password should be at least 6 characters') {
        ScaffoldMessenger.of(context).showSnackBar(snackbarPassword);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackBarErrorOccurred);
      }
    }
  }
}

final snackBarErrorFormatEmail = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Warning!',
    message: 'The email address is badly formatted, please try again !',
    contentType: ContentType.warning,
  ),
);

final snackBarErrorOccurred = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Warning!',
    message: 'Something error occurred, please try again !',
    contentType: ContentType.warning,
  ),
);

final snackbarUsedEmail = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Warning!',
    message:
        'The email address is already in use by another account, please use another email !',
    contentType: ContentType.warning,
  ),
);
final snackbarPassword = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.transparent,
  content: AwesomeSnackbarContent(
    title: 'Warning!',
    message: 'Password should be at least 6 characters, please !',
    contentType: ContentType.warning,
  ),
);
