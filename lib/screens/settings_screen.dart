import 'package:coco/components/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:coco/router/router.dart' as route;

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool systemTheme = false;
  bool darkSwitch = false;
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
            leading: const Icon(Icons.settings),
            title: const Text("Use System Theme"),
            subtitle: const Text('The theme is according to system setting....'),
            trailing: Switch(
                onChanged: (bool? value) {
                  setState(() {
                    systemTheme = !systemTheme;
                  });
                },
                value: systemTheme),
          ),
          Visibility(
            visible: systemTheme,
              child: const Divider(height: 0)
          ),
          Visibility(
            visible: systemTheme,
            child: ListTile(
              leading: darkSwitch ? const Icon(Icons.dark_mode) : const Icon(Icons.light_mode),
              title: const Text("Dark Mode"),
              subtitle: const Text('Toggle between dark mode on and off....'),
              trailing: Switch(
                  onChanged: (bool? value) {
                    setState(() {
                      darkSwitch = !darkSwitch;
                    });
                  },
                  value: darkSwitch),
            ),
          ),
          const Divider(height: 0),
          ListTile(
            leading: const Icon(Icons.manage_accounts),
            title: const Text('Accounts'),
            subtitle: const Text('Change account details....'),
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
