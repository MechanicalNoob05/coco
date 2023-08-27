import 'package:coco/components/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:coco/router/router.dart' as route;

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      drawer: const NavDrawer(),
      body: ListView(
        children: [
          ListTile(
            leading: toggle ? Icon(Icons.dark_mode) : Icon(Icons.light_mode),
            title: Text("Dark Mode"),

            subtitle: Text('Toggle between dark mode on and off....'),
            trailing: Switch(
                onChanged: (bool? value) {
                  setState(() {
                    toggle = !toggle;
                  });
                },
                value: toggle),
          ),
          const Divider(height: 0),
          ListTile(
            leading: Icon(Icons.manage_accounts),
            title: Text('Accounts'),
            subtitle: Text('Change account details....'),
            onTap: () {
              Navigator.popAndPushNamed(context, route.accountSettingsPage);
            },
          ),
          const Divider(height: 0),
          const ListTile(
            leading: Icon(Icons.help),
            title: Text('About us'),
            subtitle: Text('View information about creator....'),
          ),
          const Divider(height: 0),
          const ListTile(
            leading: Icon(Icons.support_agent),
            title: Text('Contact us'),
            subtitle: Text('Want to give feedback ....'),
          ),
          const Divider(height: 0)
        ],
      ),
    );
  }
}
