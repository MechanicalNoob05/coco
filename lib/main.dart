import 'package:coco/provider/theme_provider.dart';
import 'package:coco/themes/dark_theme.dart';
import 'package:coco/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:coco/router/router.dart' as route;
import 'package:provider/provider.dart';
import 'package:coco/provider/shoplist_provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool auth = true;

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ShopFoodListProvider>(create: (context) => ShopFoodListProvider()),
        ChangeNotifierProvider<ShopAcessoriesListProvider>(create: (context) => ShopAcessoriesListProvider()),
        ChangeNotifierProvider<ShopMedicineListProvider>(create: (context) => ShopMedicineListProvider()),
        ChangeNotifierProvider<LikeProvider>(create: (context) => LikeProvider()),
        ChangeNotifierProvider<AllShopListProvider>(create: (context) => AllShopListProvider()),
        ChangeNotifierProvider<ThemeProvider>(create: (context) => ThemeProvider())
      ],
      builder: (context, child){
        final provider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Coco',
          darkTheme: provider.followsystem ? darkTheme : provider.theme,
          theme: provider.followsystem ? lightTheme : provider.theme,
          onGenerateRoute: route.generalController,
          initialRoute: route.Splash,
        );
      }
    );
  }
}



