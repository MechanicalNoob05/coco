import 'package:coco/screens/allShopScreenCollection/pet_shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:coco/components/navigation_drawer.dart';


class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Shop"),
          actions: [
            IconButton(
                onPressed: (){
                },
                icon: const Icon(Icons.shopping_cart)
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.pets,
                  size: 20,
                ),
                text: 'Pet Shop',
              ),
              Tab(
                icon: Icon(
                  Icons.archive,
                  size: 20,
                ),
                text: 'Pet Accessories',
              ),
              Tab(
                icon: Icon(
                  Icons.medical_services,
                  size: 20,
                ),
                text: 'Pet Medicines',
              ),
            ],
          ),
        ),
        drawer: const NavDrawer(),
        body: const TabBarView(
            children: [
              PetShopScreen(),
              Text("122"),
              Text("5fsd")
            ]
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () { },
          child: const Icon(Icons.search),
        ),
      ),
    );
  }
}
