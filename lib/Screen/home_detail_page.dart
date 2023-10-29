// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:Catalog_app/models/catalog.dart';
import 'package:Catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailpage extends StatelessWidget {
  final Item catalog;

  const HomeDetailpage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: const Color(0xfff5f5f5),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.red900.xl.bold.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyTheme.darkBluishColor),
                shape: MaterialStateProperty.all(
                  const StadiumBorder(),
                ),
              ),
              child: "Buy".text.make(),
            ).wh(90, 50)
          ],
        ).p16(),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.network(catalog.image))
                  .h32(context),
              Expanded(
                  child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  color: const Color(0xfff5f5f5),
                  width: context.screenWidth,
                  child: Column(children: [
                    catalog.name.text.xl
                        .color(MyTheme.darkBluishColor)
                        .bold
                        .make(),
                    catalog.discript.text
                        .textStyle(context.captionStyle)
                        .make(),
                    10.heightBox,
                    "Sit eos labore no elitr et justo consetetur lorem lorem dolor. Et sed eos at dolores sed sadipscing vero, magna sadipscing lorem dolores magna. Sanctus accusam vero dolores et invidunt ut et dolor duo. Diam amet sed dolor dolore. Duo."
                        .text
                        .textStyle(context.captionStyle)
                        .make()
                        .p20(),
                  ]).py64(),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
