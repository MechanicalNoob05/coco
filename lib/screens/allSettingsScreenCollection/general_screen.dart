import 'package:coco/components/navigation_drawer.dart';
import 'package:flutter/material.dart';
class GeneralSettingsPage extends StatelessWidget {
  const GeneralSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("General Settings"),
      ),
      drawer: NavDrawer(),
    );
  }
}
