import 'dart:math';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mart/utils/custom_sort.dart';

import '../constants.dart';
import '../model/product_model.dart';


 class ProductController extends GetxController{

   //manually initialising productdlist with two products
   ProductModel product1 = new ProductModel(name:"Hats",rating:2,description:"good",date:DateTime.now().toString());
   ProductModel product2 = new ProductModel(name:"Dress",rating:4,description:"Not bad",date:DateTime.now().toString());
   final productImages = Constants.productImages ;
   List<ProductModel> productsList = <ProductModel>[].obs;
   List<ProductModel> allProducts = <ProductModel>[];

   void onInit() {
     // called immediately after the widget is allocated memory
     product1.image = productImages[Random().nextInt(productImages.length)];
     product2.image = productImages[Random().nextInt(productImages.length)];
     allProducts.add(product1);
     allProducts.add(product2);
     productsList = allProducts ;
     super.onInit();
   }


   List getProducts(){
    return allProducts ;
  }

    bool addProduct(data){
      for(var i=0;i<allProducts.length;i++){
        if(allProducts[i].name == data.name){
          return false ;
        }
      }
      data.image = productImages[Random().nextInt(productImages.length)];
      allProducts.add(data);
      productsList = allProducts ;
      update();
      return true ;
  }
  void deleteProduct(data){
    allProducts.remove(data);
    productsList.remove(data);
    update();
  }

  void editProduct(data){
    for(var i=0;i<allProducts.length;i++){
      if(productsList[i].name == data.name){
        productsList[i]=data;
      }
      if(allProducts[i].name == data.name){
        allProducts[i]=data;
      }

    }
    update();
  }

   void searchProductByName(name){
     if(name.length==0){
       productsList = allProducts ;
     }else{
       productsList = [];
       for(var i=0;i<allProducts.length;i++){
         if(allProducts[i].name.toLowerCase().contains(name.toLowerCase())){
           productsList.add(allProducts[i]);
         }
       }
     }
     print(productsList.length);
     update();
   }

   void searchProductByDate(time) async{
     var date = DateFormat('yyyy-MM-dd').format(time).toString() ;
     productsList = allProducts ;
     List<ProductModel> temp = [] ;
     for(var i=0;i<productsList.length;i++){
       var p = await DateFormat('yyyy-MM-dd').format(DateTime.parse(productsList[i].date)).toString() ;
       print(date+"........."+p);
       if(date==p){
         temp.add(allProducts[i]);
       }
     }
     print(productsList.length);
     print(temp.length);
     productsList = temp ;
     update();
   }

   void sortByName(){
     productsList.sort((a,b)=>sortString(a,b));
     update();
   }

   void sortProductByRating(check){
     if(check){
       productsList.sort((a,b)=>mySortComparisonDsc(a,b));
     }else{
       productsList.sort((a,b)=>mySortComparisonAsc(a,b));
     }
     update();
   }

   void refreshFilters(){
    productsList = allProducts ;
     update();
   }


}