import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/custom_card.dart';
import '../../provider/shoplist_provider.dart';

class PetAcessoriesScreen extends StatefulWidget {
  const PetAcessoriesScreen({super.key});

  @override
  State<PetAcessoriesScreen> createState() => _PetAcessoriesScreenState();
}

class _PetAcessoriesScreenState extends State<PetAcessoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<ShopAcessoriesListProvider>(
      builder: (context, value, child) {
        final photos = value.shoplist;
        final bool isLoading = value.isLoading;
        return isLoading
            ? const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Fetching Products",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ))
            : ListView.builder(
            itemCount: value.shoplist.length,
            itemBuilder: (context, index) {
              final photo = photos[index];
              return CustomCard(details: photo);
            });
      },
    ));;
  }
}

