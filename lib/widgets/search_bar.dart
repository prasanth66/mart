import 'package:flutter/material.dart';
import 'package:mart/controller/product_controller.dart';
import 'package:mart/extensions.dart';
import 'package:get/get.dart';

class SearchBar extends StatelessWidget {
   SearchBar({Key? key}) : super(key: key);

  final productController = Get.put(ProductController());

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: (){
        print(searchController.text);
        productController.searchProductByName(searchController.text);

      },
      child: Container(
        constraints: BoxConstraints(minWidth: 100, maxWidth: 500),
        decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),color:Color(0xFFEFF3F6),),
        child: TextFormField(
          controller: searchController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search Product by name",
            prefixIcon: Icon(Icons.search),

          ),

        ),
      ).addNeumorphism(
        borderRadius : 3.0,
        offset : const Offset(6, 2),
        blurRadius : 6.0,
        topShadowColor : Color.fromRGBO(255, 255, 255, 0.9),
        bottomShadowColor : Color.fromRGBO(255, 255, 255, 0.9),
      ),
    );

  }
}
