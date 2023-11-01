import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_2/Screen/cart_page.dart';
import 'package:flutter_application_2/Screen/home_page.dart';
import 'package:flutter_application_2/Screen/login_page.dart';
import 'package:flutter_application_2/Screen/signup.dart';
import 'package:flutter_application_2/utilis/routes.dart';
import 'package:flutter_application_2/widgets/themes.dart';
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
      initialRoute: (FirebaseAuth.instance.currentUser != null)
          ? MyRoutes.homeRoutes
          : "/",
      routes: {
        // ignore: prefer_const_constructors
        "/": (context) => LoginPage(),
        MyRoutes.homeRoutes: (context) => const HomePage(),
        // ignore: prefer_const_constructors
        MyRoutes.LoginRoutes: (context) => LoginPage(),
        MyRoutes.cartRoutes: (context) => const CartPage(),
        MyRoutes.signupRoutes: (context) => const Signup(),
      },
    );
  }
}
