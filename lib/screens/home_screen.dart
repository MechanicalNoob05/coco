import 'package:flutter/material.dart';
import 'package:coco/components/navigation_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: const NavDrawer(),
        body: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(child: Text("Home")),
        )
    );
  }
}

