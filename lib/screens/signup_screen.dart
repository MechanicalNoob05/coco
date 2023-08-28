

import 'package:flutter/material.dart';

import 'package:coco/router/router.dart' as route;


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

final url = Uri.parse("http://localhost:3000/user/signup");

class _SignupPageState extends State<SignupPage> {
  final nameController =TextEditingController();
  final emailController =TextEditingController();
  final passwordController =TextEditingController();

  // _register() async {
  //   var data ={
  //    'name':'wellhello',
  //    'email':'cartel@gamil.com',
  //    'password':'password',
  //   };
  //   var res = await Callapi().postData(data,'signup');
  //   //:w
  //   var body = json.decode(res.body);
  //   if(body != null ){
  //     Navigator.pushNamed(context, route.homePage);
  //   }
  //   else{
  //   const AlertDialog(content:  Text("Please recheck your details...."),
  //   title:  Text("Error"),
  //   );
  //   }
  // }

  @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      nameController.dispose();
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
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.purple,
                    Colors.black87
              ])),
              child: const Padding(
                padding: EdgeInsets.only(top: 60.0, left: 22),
                child: Text(
                  'Create\n a New Account',
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
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Spacer(),
                      const TextField(
                        decoration: InputDecoration(
                            suffixIcon:
                                Icon(Icons.account_circle, color: Colors.grey),
                            label: Text(
                              "Name",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.email, color: Colors.grey),
                            label: Text(
                              "Email",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            suffixIcon:
                                Icon(Icons.visibility_off, color: Colors.grey),
                            label: Text(
                              "Password",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.check, color: Colors.grey),
                            label: Text(
                              "Confirm Password",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                      const Spacer(),
                      FilledButton(
                        style:
                            FilledButton.styleFrom(minimumSize: const Size(400, 50)),
                        onPressed: () {
                          Navigator.popAndPushNamed(context, route.homePage);
                          //_register();
                        },
                        child: const Text("Sign up"),
                      ),
                      const Spacer(),
                      const Align(
                        alignment: Alignment.center,
                        child: Text("Already Have an account ?",
                            style: TextStyle()),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(context, route.loginPage);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                              Theme.of(context).colorScheme.primary),
                        ),
                      ),
                      const SizedBox(
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
