//create class
import 'package:flutter/material.dart';
import '../controller/registrationController.dart';

class RegistrationPage extends StatefulWidget {
  //manditory override
  @override
  State<StatefulWidget> createState() {
    //return function
    return RegistrationPageState();
  }
}

//creates class
//This is the current state of the page
class RegistrationPageState extends State<RegistrationPage> {
  //controller
  RegistrationController controller;
  //allows controller to have access to context
  BuildContext context;
  //form key
  var formKey = GlobalKey<FormState>();

  var timeDilation;

  String dropdownValue = '---Select State---';

  bool checkboxValue = false;

  String selectedSalutation;

  RegistrationPageState() {
    //pass this current state
    controller = RegistrationController(this);
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
        body: Column(
          children: <Widget>[
            //Form
            Form(
                key: formKey,
                child: Expanded(
                  child: ListView(
                    children: <Widget>[
                      //Create text field for username
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.email), hintText: "Email Address"),
                        keyboardType: TextInputType.emailAddress,
                        validator: controller.validateEmail,
                        autocorrect: false,
                        onSaved: controller.saveEmail,
                      ),

                      //Create textfield for password
                      TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.security),
                          hintText: "Password",
                        ),

                        //show text back to user , hide text
                        obscureText: true,
                        //set keyboard
                        keyboardType: TextInputType.visiblePassword,
                        autocorrect: false,
                        validator: controller.validatePass,
                        onSaved: controller.savePassword,
                      ),

                      //Confirm Password
                      TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.security),
                          hintText: "Confirm Password",
                        ),

                        //show text back to user, Hide text
                        obscureText: true,
                        //set keyboard
                        keyboardType: TextInputType.visiblePassword,
                        autocorrect: false,
                        validator: controller.validateConfirmPass,
                        onSaved: controller.saveConfirmPass,
                      ),

                      //Telephone
                      TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.phone),
                          hintText: "10 digits: 4051111111",
                        ),

                        //set keyboard
                        keyboardType: TextInputType.phone,
                        autocorrect: false,
                        validator: controller.validatePhone,
                        onSaved: controller.savePhone,
                      ),

                      //Create textfield for password
                      TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.location_city),
                          hintText: "City",
                        ),

                        //set keyboard
                        keyboardType: TextInputType.text,
                        autocorrect: false,
                        validator: controller.validateCity,
                        onSaved: controller.saveCity,
                      ),

                      // //Create textfield for password
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     icon: Icon(Icons.location_city),
                      //     hintText: "State",
                      //   ),

                      //   //set keyboard
                      //   keyboardType: TextInputType.text,
                      //   autocorrect: false,
                      //   validator: controller.validateState,
                      //   onSaved: controller.saveState,
                      // ),

                      // Icon(
                      //   Icons.location_city,
                      //   color: Colors.green,
                      //   size: 30.0,
                      // ),

                      DropdownButtonFormField<String>(
                        value: selectedSalutation,
                        hint: Text(
                          'State',
                        ),
                        onChanged: (salutation) =>
                            setState(() => selectedSalutation = salutation),
                            onSaved: controller.saveState,
                        validator: controller.validateState,                            
                        items: [
                          "Alabama",
                          "Alaska",
                          "Arizona",
                          "Arkansas",
                          "California",
                          "Colorado",
                          "Connecticut",
                          "Delaware",
                          "Florida",
                          "Hawaii",
                          "Idaho",
                          "Illinois",
                          "Indiana",
                          "Iowa",
                          "Kansas",
                          "Kentucky",
                          "Louisiana",
                          "Maine",
                          "Maryland",
                          "Massachusetts",
                          "Michigan",
                          "Minnesota",
                          "Mississippi",
                          "Missouri",
                          "Montana",
                          "Nebraska",
                          "Nevada",
                          "New Hampshire",
                          "New Jersey",
                          "New Mexico",
                          "New York",
                          "North Carolina",
                          "North Dakota",
                          "Ohio",
                          "Oklahoma",
                          "Oregon",
                          "Pennsylvania",
                          "Rhode Island",
                          "South Carolina",
                          "South Dakota",
                          "Tennessee",
                          "Texas",
                          "Utah",
                          "Vermont",
                          "Virginia",
                          "Washington",
                          "oWest Virginiane",
                          "Wisconsin",
                          'Wyoming']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                     

                      CheckboxListTile(
                        title: const Text('Agree to terms and conditions'),
                        value: checkboxValue,
                        onChanged: (bool value) {
                          //print("Value ////////////////// ${value} ");
                          setState(
                            () {
                              //changes value of the box.
                              checkboxValue = value;
                              controller.saveTerms(value);
                            },
                          );
                        },

                        //secondary: const Icon(Icons.pages),
                      ),

                      //create Button
                      RaisedButton(
                        child: Text("Create Account"),
                        onPressed: controller.register,
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
} //End of Class
