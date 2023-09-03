import 'package:coco/components/navigation_drawer.dart';
import 'package:coco/provider/shoplist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coco/router/router.dart' as route;

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LikeProvider>(context);
    final liked = provider.words;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: provider.words.isEmpty ?
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Cart is Empty"),
            TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, route.homePage);
                },
                child: const Text("Return to Shopping",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                )
            )
          ],
        ),
      ):
      Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(

            itemCount: liked.length,
            itemBuilder: (context, index) {
              final user = liked[index];
              return Card(
                color: Colors.purple.shade50,
                child: ListTile(
                  title: Text(user),
                  trailing: IconButton(icon:
                  const Icon(
                    Icons.delete_rounded,
                    color: Colors.red,
                  ),
                    onPressed: () {
                      provider.toggleLike(user);
                    },
                  ),
                ),
              );
            }
        ),
      ),
      floatingActionButton: Visibility(
        visible: provider.words.isEmpty ? false:true,
        child: FloatingActionButton(
          onPressed: (){
            provider.clearLike();
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.delete_sweep),
        ),
      ),
    );
  }
}
