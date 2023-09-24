// import 'package:coco/provider/shoplist_provider.dart';
// import 'package:coco/screens/allShopScreenCollection/cart_screen.dart';
// import 'package:coco/screens/allShopScreenCollection/pet_acessories_screen.dart';
// import 'package:coco/screens/allShopScreenCollection/pet_medicine_screen.dart';
// import 'package:coco/screens/allShopScreenCollection/pet_shop_screen.dart';
// import 'package:coco/screens/allShopScreenCollection/search_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:coco/components/navigation_drawer.dart';
// import 'package:provider/provider.dart';
//
//
// class ShopPage extends StatefulWidget {
//   const ShopPage({super.key});
//
//   @override
//   State<ShopPage> createState() => _ShopPageState();
// }
//
// class _ShopPageState extends State<ShopPage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       Provider.of<ShopAcessoriesListProvider>(context, listen: false).getAllShopItems();
//       Provider.of<ShopMedicineListProvider>(context, listen: false).getAllShopItems();
//       Provider.of<ShopFoodListProvider>(context, listen: false).getAllShopItems();
//       Provider.of<AllShopListProvider>(context, listen: false).getAllShopItems();
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       initialIndex: 0,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Shop"),
//           actions: [
//             IconButton(
//               onPressed: (){
//                 Navigator.of(context).push(
//                     MaterialPageRoute(
//                         builder: (context)=>const CartScreen()
//                     )
//                 );
//               },
//               icon: const Icon(Icons.shopping_cart)
//             )
//           ],
//           bottom: const TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(
//                   Icons.pets,
//                   size: 20,
//                 ),
//                 text: 'Pet Shop',
//               ),
//               Tab(
//                 icon: Icon(
//                   Icons.archive,
//                   size: 20,
//                 ),
//                 text: 'Pet Accessories',
//               ),
//               Tab(
//                 icon: Icon(
//                   Icons.medical_services,
//                   size: 20,
//                 ),
//                 text: 'Pet Medicines',
//               ),
//             ],
//           ),
//         ),
//         drawer: const NavDrawer(),
//         body: const TabBarView(
//           children: [
//             PetShopScreen(),
//             PetAcessoriesScreen(),
//             PetMedicineScreen()
//           ]
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             Navigator.of(context).push(
//                 MaterialPageRoute(
//                     builder: (context)=>const SearchScreen()
//                 )
//             );
//           },
//           child: const Icon(Icons.search),
//         ),
//       ),
//     );
//   }
// }
import 'package:coco/components/navigation_drawer.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}
const List<String> list = <String>['Lawyer', 'Notary', 'Writer'];
class _ShopPageState extends State<ShopPage> {

  String data="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Services"),
      ),
      drawer: const NavDrawer(),
      body: Center(
        child: Column(
          children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 const Text("Filter By",
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 16
                   ),
                 ),
                 DropdownMenu<String>(
                   initialSelection: list.first,
                   onSelected: (String? value) {
                     setState(() {
                       data = value.toString();
                     });
                   },
                   dropdownMenuEntries:   list.map<DropdownMenuEntry<String>>((String value) {
                     return DropdownMenuEntry<String>(value: value, label: value);
                   }).toList(),

                 ),
               ],
             ),
           ),
            Text(data),
          ],
        ),
      ),
    );
  }
}
