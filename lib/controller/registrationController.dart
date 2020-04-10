import '../model/regUser.dart';

import '../view/registrationPage.dart';

class RegistrationController {

  //creates LoginPage state
  RegistrationPageState state;

  //Reg User object
  RegUser user = RegUser();

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
      return null;
    } else {
      return 'Password Must Be 8 Characters';
    }
  }

  String validateConfirmPass(String value) {
    if (value.length > 7) {
      return null;
    } else {
      return 'Password Must Be 8 Characters';
    }
  }

  String validatePhone(String value) {
    if (value.length > 9) {
      return null;
    } else {
      return 'Phone Number Must Be 10 Digits';
    }
  }

  String validateCity(String value) {
    if (value != null) {
      return null;
    } else {
      return 'Must Enter City';
    }
  }
  
  String validateState(String value) {
    if (value != null) {
      return null;
    } else {
      return 'Must Enter State';
    }
  }

  /////////////////////////////////////////////////End

//////////////////////////////////////Save User Input
  void register() async{

    
    //make sure all input fields are correct
    //calling all the validators back at the loginpage
    if (state.formKey.currentState.validate()) {

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
         print(user.email);
         print("////////////////////////////////// LOGIN");

      //   user.uid = await Firebase.login(email: user.email, password: user.password);

      //   Navigator.push(
      //     state.context,
      //     MaterialPageRoute(
      //       //shorthand notation. return destin.. with brackets
      //       builder: (BuildContext context) => HomePage(),
      //     ));
      // }catch(err){
      //   print("ERROR: In login() loignController");
      // }
      
      // if(user.uid != null){

      // }
      //login in to Firebase;

    }    
    print("NOT MAKING IT IN LOGINI CONTORLLER IF");

  }//////////






}//end of class
