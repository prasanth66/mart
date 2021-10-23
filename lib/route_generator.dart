import 'package:flutter/material.dart';
import 'package:mart/main.dart';
import 'package:mart/view/dash_board.dart';
import 'package:mart/view/product.dart';


class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){

    final args = settings.arguments;


    switch(settings.name){
      case '/dashboard':
        return MaterialPageRoute(
            settings: RouteSettings(name: '/dashboard'),
          builder: (_)=>DashBoard(

            // data:args
          )
        );
      case '/product':{
      print(args);
       return  args==null? errorRoute(): MaterialPageRoute(
    settings: RouteSettings(name: '/product'),
    builder: (_)=>Product(
    data:args

    )
    );


      }

      default :
        return errorRoute();
    }
  }
}

  Route<dynamic>errorRoute(){
  return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_){
    return Scaffold(
    appBar: AppBar(title: Text("error"),),
    body: Center(child: Text("error"),),
    );
});
}

