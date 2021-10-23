import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mart/controller/product_controller.dart';
import 'package:mart/model/product_model.dart';

class OptionsCard extends StatelessWidget {
   OptionsCard({Key? key,required this.index}) : super(key: key);
  final int index ;
  final productController = Get.put(ProductController());

  get pointer => null;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        mini: true,
        child: SpeedDial(
          icon: Icons.more_vert,
          activeIcon: Icons.clear,
          curve: Curves.bounceIn,
          visible: true,
          // buttonSize: 30.0,
          overlayColor: Colors.black,
          overlayOpacity: 0.7,
          tooltip: 'Extra fetaures',
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
                child: Icon(Icons.edit,size: 22,),
                label: 'Edit Product',
                backgroundColor: Colors.white,
                onTap: (){
                  ProductModel product = productController.productsList[index];
                  Navigator.of(context).pushNamed('/product',arguments: product);

                }
            ),
            SpeedDialChild(
                child: Icon(Icons.delete),
                label: 'delete product',
                backgroundColor: Colors.white,
                onTap:(){

                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text('ALERT BOX'),
                        content: Text('Are you  sure to delete the product'),
                        actions: [
                          TextButton(
                              onPressed: (){
                                Navigator.of(ctx).pop();
                              },
                              child: Text("NO")
                          ),
                          TextButton(
                              onPressed: (){
                                productController.deleteProduct(productController.productsList[index]);
                                Navigator.of(ctx).pop();
                              },
                              child: Text("YES")
                          )
                        ],
                      )
                  );
                }
            ),

          ],
        ),
      ),
    );
  }
}
