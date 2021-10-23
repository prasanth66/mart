import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mart/controller/product_controller.dart';
import 'package:mart/extensions.dart';
import 'package:mart/widgets/options_card.dart';
import 'package:mart/widgets/star_rating_card.dart';
import 'package:get/get.dart';


import '../constants.dart';
import '../responsive.dart';

class GridViewCard extends StatefulWidget {
  const GridViewCard({Key? key}) : super(key: key);

  @override
  State<GridViewCard> createState() => _GridViewCardState();
}

class _GridViewCardState extends State<GridViewCard> {

  final productController = Get.put(ProductController());
  final productImages = Constants.productImages ;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GetBuilder(
      init: ProductController(),
      builder: (data)=>GridView.count(
        crossAxisCount: Responsive.isMobile(context)?2:4,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 10.0,
        shrinkWrap: true,
        children: List.generate(productController.productsList.length, (index) {
          return Container(
            decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),color:Color(0xFFEFF3F6),),

            child: Column(

              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.asset(
                          productImages[Random().nextInt(productImages.length)],
                          fit: BoxFit.fill,
                        ),
                      ),
                      OptionsCard(index: index,),
                    ],
                  ),
                ),
                GetBuilder<ProductController>(
                  init:ProductController(),
                  builder: (data)=>Text(
                    "${data.productsList[index].name}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),

                SizedBox(height: 10,),
                GetBuilder<ProductController>(
                  init:ProductController(),
                  builder: (data)=>StarRatingCard(rating:data.productsList[index].rating),
                ),
              ],
            ),
          ).addNeumorphism(
            borderRadius : 3.0,
            offset : const Offset(6, 2),
            blurRadius : 6.0,
            topShadowColor : Color.fromRGBO(255, 255, 255, 0.9),
            bottomShadowColor : Color.fromRGBO(255, 255, 255, 0.9),
          );
        },),
      ),
    );
  }
}
