import 'package:coco/components/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:coco/router/router.dart' as route;
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
            leading: const Icon(Icons.miscellaneous_services),
            title: const Text('General'),
            subtitle: const Text('Look and feel of application....'),
            onTap: (){
              Navigator.popAndPushNamed(context, route.generalSettingsPage);
            },
          ),
          const Divider(height: 0),
          const ListTile(
            leading: Icon(Icons.manage_accounts),
            title: Text('Accounts'),
            subtitle: Text('Change account details....'),
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
