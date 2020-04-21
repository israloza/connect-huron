
import 'package:flutter/material.dart';
import 'src/pages/botones_page.dart';
import 'src/pages/scroll_page.dart';




void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

   


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HURONCONNECT',
      initialRoute: 'login',
      routes: {
        'login'  : (BuildContext context ) => ScrollPage(),
        'menu' : (BuildContext context ) => BotonesPage(),
      },
    );
  }

}