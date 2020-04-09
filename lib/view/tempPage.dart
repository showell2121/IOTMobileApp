//create class
import 'package:flutter/material.dart';
import '../controller/tempController.dart';

class TempPage extends StatefulWidget {
  //manditory override
  @override
  State<StatefulWidget> createState() {
    //return function
    return TempPageState();
  }
}

//creates class
//This is the current state of the page
class TempPageState extends State<TempPage> {

  //controller
  TempController controller;
  //allows controller to have access to context
  BuildContext context;

  TempPageState() {
    //pass this current state
    controller = TempController(this);
  }

  @override
  Widget build(BuildContext context) {
    //store context information in the instance variable
    this.context = context;

    // return the scaffold
    return Scaffold(
      //Beginning of Scaffold
      appBar: AppBar(
        title: new Center(
            child: new Text(
          "Registration",
          style: TextStyle(color: Color.fromARGB(250, 0, 0, 0)),
        )),
      ),

      //Second part of Scaffold
      body: Text("Reg Body"),
    );
  }
} //End of Class
