import 'package:flutter/material.dart';
class SingleProduct extends StatelessWidget {
  final String Name;
  SingleProduct({super.key, required this.Name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Name),
      ),
      body: Text(Name),
    );
  }
}
