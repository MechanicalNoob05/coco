import 'package:coco/components/custom_card.dart';
import 'package:flutter/material.dart';
class PetShopScreen extends StatelessWidget {
  const PetShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                customCard(),
                customCard(),
                customCard(),
                customCard(),
                customCard(),
                customCard(),
              ],
            ),
          )
      ),
    );
  }
}

