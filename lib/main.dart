import 'package:Catalog_app/Screen/cart_page.dart';
import 'package:Catalog_app/Screen/home_page.dart';
import 'package:Catalog_app/Screen/login_page.dart';
import 'package:Catalog_app/utilis/routes.dart';
import 'package:Catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        // ignore: prefer_const_constructors
        "/": (context) => LoginPage(),
        MyRoutes.homeRoutes: (context) => const HomePage(),
        // ignore: prefer_const_constructors
        MyRoutes.LoginRoutes: (context) => LoginPage(),
        MyRoutes.cartRoutes: (context) => const CartPage(),
      },
    );
  }
}
