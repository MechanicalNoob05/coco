import 'package:coco/components/custom_card.dart';
import 'package:coco/models/Args.dart';
import 'package:flutter/material.dart';
class PetShopScreen extends StatelessWidget {
  const PetShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: dummyProducts.map((e) {
              return CustomCard(
                name: e['name'],
                price: e['price'],
              );
            }).toList(),
          )
      ),
    );
  }
}

