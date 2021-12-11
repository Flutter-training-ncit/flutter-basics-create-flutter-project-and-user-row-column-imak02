/// Create a screen (with scafold) and it should have the following widgets:
/// 1. AppBar with it's title "Testing textfields". Use the widget Textfield or TextFormField
/// 2. body: Should have 2 textfield vertically which ask for Email and password.
/// 3. Button which says "Sign In"
/// 4.When button is pressed user has to be navigated to a new screen which has title "Home"
///

import 'package:flutter/material.dart';
import 'package:tiktok_apk/tiktok_apk_main.dart';
import 'package:tiktok_apk/utils/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Text field"),
        ),
        body: Form(
          autovalidateMode: AutovalidateMode.always,
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.blue),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Email *',
                        hintText: 'Enter your email'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (val) {
                      print(val);
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Please enter your email address";
                      }

                      if (value.isEmpty) {
                        return "Please enter your email address";
                      }

                      String pattern =
                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                          r"{0,253}[a-zA-Z0-9])?)*$";
                      RegExp regex = RegExp(pattern);
                      if (!regex.hasMatch(value))
                        return 'Enter a valid email address';
                      else
                        return null;

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) {
                      print(value);
                      if (value == null) {
                        return "Password must not be empty";
                      }
                      if (value.isEmpty) {
                        return "Password must not be empty";
                      }
                      if (value.length < 6) {
                        return "Password must be greater than 6 characters.";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.blue),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Password*',
                        hintText: 'Enter Password'),
                  ),
                ),
                MaterialButton(
                  minWidth: 200,
                  color: Colors.green,
                  onPressed: () {
                    if (formKey.currentState != null) {
                      formKey.currentState!.validate();
                    }
                    if (formKey.currentState!.validate()) {
                      SharedPref.setUserHasLoggedIn(true);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return TiktokApk();
                          },
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
