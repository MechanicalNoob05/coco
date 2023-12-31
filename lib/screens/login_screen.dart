import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:coco/router/router.dart' as route;
import 'package:shared_preferences/shared_preferences.dart';

import '../services/upload_photo_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  _login() async {
    var data = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    var res = await Callapi().postLoginData(data, 'login');
    //:w
    var body = json.decode(res.body);
    if (body['sucess']) {
      var nav = Navigator.pushNamed(context, route.homePage);

      var sharedpref = await SharedPreferences.getInstance();
      sharedpref.setString("token",body['token']);
      nav;
    } else {
      const AlertDialog(
        content: Text("Please recheck your details...."),
        title: Text("Error"),
      );
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.purple,
                    Colors.black87
              ])),
              child: const Padding(
                padding: EdgeInsets.only(top: 60.0, left: 22),
                child: Text(
                  'Welcome\n Login to Proceed',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.email, color: Colors.grey),
                            label: Text(
                              "Email",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: const InputDecoration(
                            suffixIcon:
                                Icon(Icons.visibility_off, color: Colors.grey),
                            label: Text(
                              "Password",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text("Forgot Password ?",),
                      ),
                      const Spacer(),
                      FilledButton(
                        style: FilledButton.styleFrom(
                            minimumSize: const Size(400, 50)),
                        onPressed: () async {
                          // Navigator.pushReplacementNamed(context,
                          //   route.homePage,
                          //   // arguments: {'name':"John"}
                          // );
                          _login();
                        },
                        child: const Text("Login"),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text("Don't Have an account ?",),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(context, route.signupPage);
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "MechanicalNoob © 2023. All rights reserved.",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
