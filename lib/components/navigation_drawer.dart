import 'package:coco/screens/trial%20pages/ajit_trial_screen.dart';
import 'package:coco/screens/trial%20pages/samarth_trial_screen.dart';
import 'package:flutter/material.dart';
import 'package:coco/router/router.dart' as route;
import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(

            decoration: BoxDecoration(

              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.purple,
                    Color(0xff281537),
                  ]),
            ),
            accountEmail: Text("emailaddress"),
            currentAccountPictureSize: Size(50, 50),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage("https://i.pinimg.com/564x/28/4b/7a/284b7a9e763832cf3281db31a728a665.jpg"),
            ),
            accountName: Text(
              "Username",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.popAndPushNamed(context, route.homePage);
            },
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text("Services"),
            onTap: () {
              Navigator.popAndPushNamed(context, route.shopPage);
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.downloading),
          //   title: const Text("Samarth"),
          //   onTap: (){
          //     Navigator.of(context).push(
          //         MaterialPageRoute(
          //             builder: (context)=>const SamarthTrialPage()
          //         )
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(Icons.downloading),
          //   title: const Text("Ajit"),
          //   onTap: (){
          //     Navigator.of(context).push(
          //         MaterialPageRoute(
          //             builder: (context)=>const AjitTrialPage()
          //         )
          //     );
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: (){
              Navigator.popAndPushNamed(context, route.settingsPage);
            },
          ),
          const Spacer(),
          const Text(
            "MechanicalNoob © 2023. All rights reserved.",
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () async{
              var sharedpref = await SharedPreferences.getInstance();
              sharedpref.remove("token");
              Navigator.pushReplacementNamed(context, route.loginPage);
            },
          )

        ],
      ),
    );
  }
}
