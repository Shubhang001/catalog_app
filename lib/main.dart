import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screen/cart_page.dart';
import 'package:flutter_application_2/Screen/home_page.dart';
import 'package:flutter_application_2/Screen/login_page.dart';
import 'package:flutter_application_2/utilis/routes.dart';
import 'package:flutter_application_2/widgets/themes.dart';

void main() {
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
        "/" :(context) => LoginPage(),
        MyRoutes.homeRoutes:(context) =>  const HomePage(),
        // ignore: prefer_const_constructors
        MyRoutes.LoginRoutes:(context) => LoginPage(),
        MyRoutes.cartRoutes:(context) => const CartPage(),
      },
    );
  }
}