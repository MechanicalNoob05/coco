import 'package:coco/components/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:coco/components/navigation_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    bool layout =  false;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        drawer: const NavDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                customCard(),
                customCard(),
              ],
            ),
          )
        ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () { },
        icon: const Icon(Icons.qr_code),
        label: const Text("Scan"),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

