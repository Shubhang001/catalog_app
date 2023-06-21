// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/utilis/routes.dart';
import 'package:flutter_application_2/widgets/home_widget/catalog_header.dart';
import 'package:flutter_application_2/widgets/home_widget/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_2/models/catalog.dart';
import 'package:flutter_application_2/widgets/drawer.dart';
import 'package:flutter_application_2/widgets/themes.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key}); 

  @override
  State<HomePage> createState() => _HomePageState();
  }

class _HomePageState extends State<HomePage> {
@override
  void initState() {
    super.initState();
    loadData();
  }

loadData()async{
  await Future.delayed(const Duration(seconds: 2));
  // ignore: unused_local_variable
  final  catalogjson=await rootBundle.loadString("assets/files/catalog.json");
  final decodedData= jsonDecode(catalogjson);
  var productsData= decodedData["products"];
  CatalogModel.items= List.from(productsData).map<Item>((item) => Item.fromMap(item)).cast<Item>().toList();
  setState(() {
     });
}


  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: FloatingActionButton(
         backgroundColor: MyTheme.darkBluishColor,
         child: const Icon(CupertinoIcons.cart),
         onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoutes),
         ),
     body: SafeArea(
       child: Container(
        padding: Vx.m24,
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CatalogHeader(),
            if(CatalogModel.items!= null && CatalogModel.items!.isNotEmpty)
            const CatalogList().py16().expand()
            else 
                const CircularProgressIndicator().centered().expand(),
          ],
         ),
       ),
     ),

    );
      
  }
}
