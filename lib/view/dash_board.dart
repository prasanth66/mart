import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:mart/controller/product_controller.dart';
import 'package:mart/extensions.dart';
import 'package:mart/widgets/grid_view_card.dart';
import 'package:mart/widgets/image_slider.dart';
import 'package:mart/widgets/information_card.dart';
import 'package:mart/widgets/list_view_card.dart';
import 'package:mart/widgets/search_bar.dart';
import '../model/product_model.dart';
import '../responsive.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  int view = 0 ;
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(

      appBar:AppBar(
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: Image.asset(
          "assets/images/companyLogo.jpg",
         fit: BoxFit.cover,
        ),
        title: Text("DASHBOARD",style: TextStyle(color: Colors.amber),),

      ),
      body: SingleChildScrollView(
        child: Container(
          margin:(Responsive.isMobile(context) || Responsive.isTablet(context)) ?EdgeInsets.all(10):EdgeInsets.fromLTRB(120, 10, 120, 10),
          child: Column(
            children: [
              ImageSlider(),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: (Responsive.isMobile(context) || Responsive.isTablet(context))?screenSize.height*0.1:screenSize.height*0.3,
                    child: Image.asset('assets/images/viewmore1.jpg',fit: BoxFit.fill,),
                  ).addNeumorphism(),
                  Container(
                      height:(Responsive.isMobile(context) || Responsive.isTablet(context))?screenSize.height*0.1: screenSize.height*0.3,
                      child: Image.asset('assets/images/viewmore2.png',fit: BoxFit.fill,)
                  ).addNeumorphism(),
                ],
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "ALL PRODUCTS",
                    style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),
                  ),
                  Responsive.isMobile(context)?FloatingActionButton(
                    onPressed: (){

                      Navigator.of(context).pushNamed('/product',arguments: true);
                    },
                    child: Icon(Icons.add),
                  ):Container(),
                ],
              ),
              SizedBox(height: 50,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Container(
                        decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),color:Color(0xFFEFF3F6),),

                        child: Row(
                          children: [
                            Text("STARS  "),
                            Tooltip(
                              message: 'get top rated products',
                              child: InkWell(
                                child: Icon(Icons.arrow_upward_outlined),
                                onTap: () {
                                  productController.sortProductByRating(true);
                                },
                              ),
                            ),
                            Tooltip(
                              message: 'get least rated products',
                              child: InkWell(
                                child: Icon(Icons.arrow_downward_outlined),
                                onTap: () {
                                  productController.sortProductByRating(false);
                                },
                              ),
                            ),
                          ],
                        ),
                      ).addNeumorphism(
          borderRadius : 3.0,
          offset : const Offset(6, 2),
          blurRadius : 6.0,
          topShadowColor : Color.fromRGBO(255, 255, 255, 0.9),
          bottomShadowColor : Color.fromRGBO(255, 255, 255, 0.9),
        ),
                      Responsive.isDesktop(context)?SearchBar():Container(),

                      Responsive.isMobile(context)?Container():Wrap(
                        children:  [
                          Text(
                              "View",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(width: 10,),
                          InkWell(
                            onTap: () {
                              setState(() {
                                view = 0 ;
                              });
                            },
                            child: Tooltip(
                              message: "Grid view",
                                child: Icon( Icons.grid_view,size: 23,color: (view==0)?Colors.cyan:Colors.black,)
                            ),
                          ),
                          SizedBox(width: 10,),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  view = 1 ;
                                });
                              },
                              child: Tooltip(
                                message: "List View",
                                  child: Icon( Icons.list_alt,size: 23,color: (view==1)?Colors.cyan:Colors.black,)
                              )
                          ),
                          SizedBox(width: 10,),
                          ElevatedButton(
                            onPressed: (){
                              Navigator.of(context).pushNamed('/product',arguments: true);
                            },
                            child: Text("ADD Product"),
                          ),
                        ],
                      )
                    ],
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Responsive.isMobile(context)?SearchBar():Container(),
              SizedBox(height: 40,),
              view==0?GridViewCard():ListViewCard(),
              SizedBox(height: 100,),
              InformationCard(),
            ],
          ),
        )
      ),

    );
  }
}
