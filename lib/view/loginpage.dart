//create class
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  //manditory override
  @override
  State<StatefulWidget> createState() {
    //return function
    return LoginPageState();
  }
}

//creates class
//This is the current state of the page
class LoginPageState extends State<LoginPage> {
  //variables

  //constructor
  LoginPageState() {
    //intialize values
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
      //center title
      appBar: AppBar(
        title: new Center(child: new Text("Login", style: TextStyle(color: Color.fromARGB(250, 0, 0, 0)),)),
      //change color of appBar
      backgroundColor: Color.fromARGB(100, 0, 100, 255),
      ),

      //Second item is Scaffold//////////////////////////////////////////////
      body: Column(
        children: <Widget>[
          //prints image
          //gets image from folders
          new Center(child: Image.asset('assets/images/pic9.jpg')),

          //Create text field for username
          TextFormField(
            decoration: InputDecoration(
                icon: Icon(Icons.email), hintText: "Email Address"),
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
          ),

          //Create textfield for password
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.security),
              hintText: "Password",
            ),

            //show text back to user
            obscureText: true,
            //set keyboard
            keyboardType: TextInputType.visiblePassword,
            autocorrect: false,
            validator: (value){},
            onSaved: (value){},
          ),

          // //Column first item
          // Text(
          //   "Count = " ,
          //   style: TextStyle(fontSize: 20),
          // ),

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
                // child: RaisedButton(
                //   child: Text("+"),
                //   onPressed: controller.upButton,
                // ),
              ),

              //Second row button
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                // child: RaisedButton(
                //   child: Text("-"),
                //   onPressed: controller.downButton,
                // ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
