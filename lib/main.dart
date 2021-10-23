import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mart/route_generator.dart';
import 'package:mart/view/dash_board.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      title: 'Mart',
      debugShowCheckedModeBanner: false,
     theme: ThemeData(
       scaffoldBackgroundColor:Color(0xFFEFF3F6),
       primarySwatch: Colors.amber
     ),
      initialRoute: '/dashboard',
      onGenerateRoute: RouteGenerator.generateRoute,
      // routes: {
      //   '/': (context) => MyHomePage(),
      //   '/dashboard': (context) => DashBoard(),
      // },
    );
  }
}


