import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../model/HomeUser.dart';

import '../view/homepage.dart';
import "./firebase.dart";

//Popup menu, list of different menus
const POPUPMENULIST = [
  'Logout',  
];

class HomePageController {

  HomePageState state;

  var amount;

  //short hand notation of above code
  //constructor
  HomePageController(this.state);  

//function called to homepage.dart to assist with menu
  List<PopupMenuEntry<String>> showPopupMenu(BuildContext context) {    

    //New menu loops through all the menus that is declared at teh top of file
    //creates no name function.
    return POPUPMENULIST.map((item) {
      return PopupMenuItem(
        value: item,
        child: Text(item),
      );
    }).toList();
    
  } // End showPopuMenu

//function called to homepage.dart to assist with menu
  void popupMenuSelected(String value) {

    if(value == "Logout"){
      
      //remove histor from stack and go to orginal page. 
      Navigator.pop(state.context);
      //Navigator.pushNamedAndRemoveUntil(state.context, "/loginPage", (r) => false);
      //print("Menu if: " + value);
      
    }else{
      print("Menu else: " + value);
    }
    
  }

  String validateAmount(String value) {
    print("in Valid");
    if (value.length > 0) {
      return null;
    } else {
      return 'Must Enter A Number';
    }
  }

  void saveAmount(String value){    
    this.amount = value;
  }  

  void login() async{
    
    //make sure all input fields are correct
    //calling all the validators back at the loginpage
    if (state.formKey.currentState.validate()) {
      //print("Before Firebase////////////////////////////////////////");   

      //read value from DB
      var feed = await Firestore.instance.collection("CatFeeder").document("RPi").get();
      
      //checks if value is false
      if(!feed.data["Feed"]){
        //changes value to true
        await Firestore.instance.collection("CatFeeder").document("RPi").updateData({"Feed": true});
      }else{
        state.stateChanged((){
          state.message = "Currently Feeding, Try Back in ${feed.data["AmountOfFood"]} Seconds.";
        });
      }
      //print("Value: ${feed.data["Feed"]}");
      
      
    }


  }

} //End Controller
