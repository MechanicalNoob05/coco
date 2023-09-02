import 'dart:async';

import 'package:flutter/material.dart';
import 'package:coco/router/router.dart' as route;
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    void whereToGo() async{
      var sharedpref = await SharedPreferences.getInstance();
      var isLoggedin = sharedpref.getBool("Login");
      Timer(Duration(milliseconds: 5),(){
        if(isLoggedin!=null){
          if(isLoggedin){
            Navigator.pushReplacementNamed(context, route.homePage );
          }else{
            Navigator.pushReplacementNamed(context, route.loginPage );
          }
        }else{
          Navigator.pushReplacementNamed(context, route.loginPage );
        }
      },);
    }
    whereToGo();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text("splash")
      ),
    );
  }
}
