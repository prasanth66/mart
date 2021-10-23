import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mart/extensions.dart';
import 'package:mart/widgets/options_card.dart';
import 'package:mart/widgets/star_rating_card.dart';
import '../constants.dart';
import '../controller/product_controller.dart';

class ListViewCard extends StatelessWidget {
   ListViewCard({Key? key}) : super(key: key);
  var list =[];

  @override
  void onInit() { // called immediately after the widget is allocated memory
    // fetchApi();
    // list = ProductController.getProducts();
    // super.onInit();
  }
   final productController = Get.put(ProductController());
   final productImages = Constants.productImages ;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProductController(),
      builder: (products)=>ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: productController.productsList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context,int index){
          return Container(
              child: Card(
                child: Column(
                  children: [
                    Container(alignment: Alignment.bottomRight,child: OptionsCard(index:index)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              productImages[Random().nextInt(productImages.length)],
                              height: 200,
                              width: 200,
                              // fit: BoxFit.cover,
                            ),

                          ],
                        ),
                        Flexible(
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              GetBuilder<ProductController>(
                                init:ProductController(),
                                builder: (data)=>Text(
                                  "${data.productsList[index].name}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),
                                ),
                              ),

                              SizedBox(height: 10,),
                              GetBuilder<ProductController>(
                                init:ProductController(),
                                builder: (data)=>StarRatingCard(rating:data.productsList[index].rating),
                              ),
                              SizedBox(height: 10,),
                              GetBuilder<ProductController>(
                                init:ProductController(),
                                builder: (data)=>Text(
                                  "${data.productsList[index].description}",
                                  style: TextStyle(


                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              )
          ).addNeumorphism();
        },
      ),
    );
  }
}

