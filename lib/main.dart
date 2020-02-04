import 'package:flutter/material.dart';

import 'HomePage.dart';
main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
        
      ),
      title: "Tic Tac Toe",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}