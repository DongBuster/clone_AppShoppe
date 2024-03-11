import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/SnackBar.dart';
import '../../../constants/error_handlingHttp.dart';
import '../../../constants/global_variables.dart';
import '../../../models/user.dart';
import '../screens/login_screen.dart';

class loginWithAccount {
  static void signUpAccount(
      {required BuildContext context,
      required email,
      required password,
      required name}) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
      );
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8',
        },
      );
      if (context.mounted) {
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const LoginScreen()));
          },
        );
      }
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  }

  static void signInAccount(
      {required BuildContext context,
      required email,
      required password}) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8'
          });

      if (context.mounted) {
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);
            if (context.mounted) {
              context.goNamed(GloblalVariable.homeScreen);
            }
          },
        );
      }
    } catch (error) {
      showSnackBar(context, error.toString());
    }
  }

  static void logOut() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('x-auth-token', '');
    } catch (error) {
      print(error.toString());
    }
  }
}
