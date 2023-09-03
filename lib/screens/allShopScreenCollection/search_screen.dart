import 'package:coco/provider/shoplist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'single_product_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late String searchTerm = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<AllShopListProvider>(builder: (context, value, child) {
        final displayList = value.shoplist;
        void updateSearchTerm(String value){
          setState(() {
            searchTerm = value.toLowerCase();
          });
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value)=> updateSearchTerm(value) ,
                decoration: const InputDecoration(
                    hintText: "Search...", suffixIcon: Icon(Icons.search)),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView.builder(
                    itemCount: displayList.length,
                      itemBuilder: (context, index) => Visibility(
                        visible: displayList[index].name.toLowerCase().contains(searchTerm) ? true :false,
                        child: ListTile(
                          leading: Image.network(displayList[index].url,
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill,
                          ),
                          title: Text(displayList[index].name),
                          subtitle: Text(displayList[index].type),
                          trailing: Text(displayList[index].pet),
                          onTap: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context)=>SingleProduct(name: displayList[index].name)
                                )
                            );
                          },
                        ),
                      )))
            ],
          ),
        );
      }),
    );
  }
}
