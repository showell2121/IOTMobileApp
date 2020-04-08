//import flutter
//Iphone stytle design , This import is not needed
import 'package:flutter/cupertino.dart';
//google style desing
import 'package:flutter/material.dart';

//imports controller
import "../controller/homepageController.dart";

//create class
class HomePage extends StatefulWidget {
  //manditory override
  @override
  State<StatefulWidget> createState() {
    //return function
    return HomePageState();
  }
}

//creates class
//This is the current state of the page
class HomePageState extends State<HomePage> {
  //variables
  int count = 0;
  HomePageController controller;

  //constructor
  HomePageState() {
    //intialize values
    controller = HomePageController(this);
  }

  //set state method to update screen
  //takes function as param
  void stateChanged(Function f) {
    //actually sets the state of the page and refreshes
    setState(f);
  }

  //manditory override
  @override
  Widget build(BuildContext context) {
    //creates Scaffold
    //Scaffold is foundation app
    return Scaffold(
      //First item is Scaffold///////////////////////////////////////////////
      appBar: AppBar(
        title: Text("Lesson 2 Home"),
        actions: <Widget>[
          //one
          Icon(Icons.ac_unit),
          
          //Two
          IconButton(
            icon: Icon(Icons.account_balance),
            onPressed: () {},
          ),

          //Three
          //generic
          // PopupMenuButton(
          //represent strings
          PopupMenuButton<String>(

            //Version 1
            //gets selected button/popupmenuitem
            // onSelected: (value){
            //       //prints value of selected menu button
            //       print("Menu: " + value);
            //     },
            //calling from cotroller not appbar
            
            // itemBuilder: (BuildContext context) {
            //   //Give menu Items in list
            //   return <PopupMenuEntry<String>>[                

            //     PopupMenuItem(
            //       value: "one",
            //       //how we want to display
            //       child: Text("ONE"),
            //     ),


            //     PopupMenuItem(
            //       value: 'two',                 
            //       //how we want to display
            //       child: Icon(Icons.filter_2),
            //     ),


            //     PopupMenuItem(
            //       value: "three",
            //       //how we want to display
            //       child: Text("THREE"),
            //     ),
            //   ];
            // },

          //New, version 2, calling from controller
          //functions for menu are stored in controller
          onSelected: controller.popupMenuSelected,
          itemBuilder: controller.showPopupMenu,

          ),
        ],
      ),

      //Second item is Scaffold//////////////////////////////////////////////
      body: Column(
        children: <Widget>[
          //Column first item
          Text(
            "Count = " + count.toString(),
            style: TextStyle(fontSize: 20),
          ),

          //Column Second item
          //first row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //First row button
              Container(
                padding: EdgeInsets.only(
                  right: 10,
                ),
                child: RaisedButton(
                  child: Text("+"),
                  onPressed: controller.upButton,
                ),
              ),

              //Second row button
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: RaisedButton(
                  child: Text("-"),
                  onPressed: controller.downButton,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
