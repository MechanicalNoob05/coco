import 'package:flutter/material.dart';
class SingleProduct extends StatelessWidget {
  final String name;
  const SingleProduct({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Text(name),
    );
  }
}
