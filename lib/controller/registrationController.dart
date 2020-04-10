import '../view/loginPage.dart';

import '../model/regUser.dart';
import 'package:flutter/material.dart';
import '../view/registrationPage.dart';

import "./firebase.dart";

class RegistrationController {
  //creates LoginPage state
  RegistrationPageState state;

  //Reg User object
  RegUser user = RegUser();

  String tempPass;

  //Set constructor to current state.// same as: state = value;
  RegistrationController(this.state);

  ///////////////////////////////Save user input
  void saveEmail(String value) {
    //saves userinput email to object
    user.email = value;
  }

  void savePassword(String value) {
    //saves userinput pass to object
    user.password = value;
  }

  void saveConfirmPass(String value) {
    //saves userinput email to object
    user.confirmPass = value;
  }

  void saveCity(String value) {
    //saves userinput pass to object
    user.city = value;
  }

  void saveState(String value) {
    //saves userinput email to object
    user.state = value;
  }

  void savePhone(String value) {
    //saves userinput pass to object
    user.phone = value;
  }

  void saveTerms(bool value) {
    //saves userinput pass to object
    user.terms = value;
  }

///////////////////////////////////end
  ///
//////////////////////////////////Validate textfield for errors
  String validateEmail(String value) {
    if (value.contains('@') && value.contains('.') && value.length > 6) {
      return null;
    } else {
      return 'Not A Valid Email. (Include @  .)';
    }
  }

  String validatePass(String value) {
    if (value.length > 7) {
      tempPass = value;
      return null;
    } else {
      return 'Password Must Be 8 Characters';
    }
  }

  String validateConfirmPass(String value) {
    if (tempPass == value) {
      return null;
    } else {
      return 'Passwords Dont Match';
    }
  }

  String validatePhone(String value) {
    if (value.length == 10) {
      return null;
    } else {
      return 'Phone Number Must Be 10 Digits';
    }
  }

  String validateCity(String value) {
    if (value.length > 2) {
      return null;
    } else {
      return 'Must Enter City';
    }
  }

  String validateState(String value) {
    if (value != null) {
      return null;
    } else {
      return 'Must Select A State';
    }
  }

  /////////////////////////////////////////////////End

//////////////////////////////////////Save User Input
  void register() async {
    //make sure all input fields are correct
    //calling all the validators back at the loginpage
    if (state.formKey.currentState.validate() &&
        user.terms != null &&
        user.terms != false) {
      //Saves user data
      //when .save() is called, all onsave: functions in loginPage will be called and object
      //will be intialized
      state.formKey.currentState.save();

      // try{

      print("////////////////////////////////// LOGIN");
      print(user.email);
      print(user.password);
      print(user.city);
      print(user.state);
      print(user.terms);
      print("////////////////////////////////// LOGIN");

      bool value = await Firebase.createAccount(user);

      if (value) {
        try {
          Navigator.push(
              state.context,
              MaterialPageRoute(
                //shorthand notation. return destin.. with brackets
                builder: (BuildContext context) => LoginPage(),
              ));
        } catch (err) {
          print("ERROR: In login() loignController");
        }
      }
    }

    print("NOT MAKING IT IN LOGINI CONTORLLER IF");
  } //////////

} //end of class
