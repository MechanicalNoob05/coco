import 'package:coco/provider/shoplist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/shopitem_model.dart';
import 'single_product_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<AllShopListProvider>(builder: (context, value, child) {
        
        final display_list = value.shoplist;
        final bool isLoading = value.isLoading;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                    hintText: "Search...", suffixIcon: Icon(Icons.search)),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView.builder(
                    itemCount: display_list.length,
                      itemBuilder: (context, index) => ListTile(
                        leading: Image.network(display_list[index].url,
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                        title: Text(display_list[index].name),
                        subtitle: Text(display_list[index].type),
                        trailing: Text(display_list[index].pet),
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context)=>SingleProduct(name: display_list[index].name)
                              )
                          );
                        },
                      )))
            ],
          ),
        );
      }),
    );
  }
}
