//using material design in this package. 
import 'package:flutter/material.dart';
import './view/loginPage.dart';



////Main program of dart
// void main(){
//   //this is the app that is run and the first function
//   runApp(Lesson2App());
// }

//short hand notation for the above code, single statement can go on one line
//Main program of dart   //this is the app that is run and the first function
void main() => runApp(Lesson2App());

//This project will extend statless widget and allow changes on same page. 
class Lesson2App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: "Lesson 2 App", 
      home: LoginPage(),
      //remove debug banner
      debugShowCheckedModeBanner: false,
      );
  }



}


