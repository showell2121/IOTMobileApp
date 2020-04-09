import 'package:flutter/material.dart';
import "../model/user.dart";

import '../view/loginPage.dart';
import "../view/registrationPage.dart";

class LoginController {
  //creates LoginPage state
  LoginPageState state;

  User user = User();

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

  void saveEmail(String value) {
    //saves userinput email to object
    user.email = value;
  }

  void savePassword(String value) {
    //saves userinput pass to object
    user.password = value;
  }

  ///////////////////////////////////Validate User info
  String validatePass(String value) {
    if (value.length > 7) {
      return null;
    } else {
      return 'Password Must be 8 Characters';
    }
  }

  String validateEmail(String value) {
    if (value.contains('@') && value.contains('.') && value.length > 6) {
      return null;
    } else {
      return 'Not a Valid Email. (Include @  .)';
    }
  }

  //////////////////////////////////////End Validate
  ///
  //////////////////////////////////////Save User Input
  void login() {
    //make sure all input fields are correct
    //calling all the validators back at the loginpage
    if (state.formKey.currentState.validate()) {
      //when .save() is called, all onsave: functions in loginPage will be called and object
      //will be intialized
      state.formKey.currentState.save();
    }

    if(user.email == "showell2121@gmail.com"){
      print("//////////////////////////////CORECTemail");
    }else{
      print("//////////////////////////////////WRONG EMAIL");
    }
  }
  ///////////////////////////////////////////End Save

  /////////////////////////////////////////////Navigate to New Page
  void popupMenuSelected(var menu) {
    var destination;
    print("In popupMenurSelected: " + menu);
    if (menu == "Reg") {
      destination = RegistrationPage();
    }

    //checks if reg is null
    if (destination != null) {
      //navigates to the correct paeg
      Navigator.push(
          state.context,
          MaterialPageRoute(
            //shorthand notation. return destin.. with brackets
            builder: (BuildContext context) => destination,
          ));
    }
  }
  /////////////////////////////////////////////End Nav
  ///
  ///
  ///
} //end of class
