import 'package:flutter/material.dart';
import '../view/homepage.dart';
import "../model/user.dart";

import '../view/loginPage.dart';
import "../view/registrationPage.dart";

import "./firebase.dart";

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

  //////////////////////////////////////End 
  ///
  //////////////////////////////////////Save User Input
  void login() async{

    
    //make sure all input fields are correct
    //calling all the validators back at the loginpage
    if (state.formKey.currentState.validate()) {

      //Saves user data
      //when .save() is called, all onsave: functions in loginPage will be called and object
      //will be intialized
      state.formKey.currentState.save();

      try{

        //print("////////////////////////////////// LOGIN");
        //print(user.email);

        user.uid = await Firebase.login(email: user.email, password: user.password);

        Navigator.push(
          state.context,
          MaterialPageRoute(
            //shorthand notation. return destin.. with brackets
            builder: (BuildContext context) => HomePage(),
          ));
      }catch(err){
        print("ERROR: In login() loignController");
      }
      
      if(user.uid != null){

      }
      //login in to Firebase;

    }    
    print("NOT MAKING IT IN LOGINI CONTORLLER IF");

  }///////////////////////////////////////////End 
  

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
  /////////////////////////////////////////////End 
  ///
  ///
  ///
} //end of class
