import 'package:coco/components/custom_card.dart';
import 'package:coco/provider/photos_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetShopScreen extends StatefulWidget {
  const PetShopScreen({super.key});

  @override
  State<PetShopScreen> createState() => _PetShopScreenState();
}

class _PetShopScreenState extends State<PetShopScreen> {
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<PhotoProvider>(
      builder: (context, value, child) {
        final photos = value.photos;
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
                itemCount: value.photos.length,
                itemBuilder: (context, index) {
                  final photo = photos[index];
                  return CustomCard(
                      name: photo.title, price: photo.id, url: photo.url);
                });
      },
    ));
  }
}
