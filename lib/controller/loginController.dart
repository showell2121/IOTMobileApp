import 'package:flutter/material.dart';

import '../view/loginPage.dart';
import "../view/registrationPage.dart";

class LoginController {

  //creates LoginPage state
  LoginPageState state;

  //Set constructor to current state.// same as: state = value; 
  LoginController(this.state);


  String validateNum1(String value) {
    //checks if value is null or empty
    if (value == null || value.isEmpty) {
      return "Enter a valid number";
    }
    //parve value
    try {
      double.parse(value);
    } catch (err) {
      return "Enter a valid number";
    }
    //No error
    return null;
  }

  void saveNum1(){

  }

  void popupMenuSelected(var menu){
    var destination;
    print("In popupMenurSelected: " + menu);
    if(menu == "Reg"){
      destination = RegistrationPage();
    }

    if(destination != null){
      Navigator.push(state.context, MaterialPageRoute(
        builder: (BuildContext context){ return destination;}

      ));
    }

  }





}//end of class
