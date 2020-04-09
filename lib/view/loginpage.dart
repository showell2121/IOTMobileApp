//create class
import 'package:flutter/material.dart';
//import '../model/user.dart';
import '../controller/loginController.dart';


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
  //member variables
  LoginController controller;
  //allows controller to have access to context
  BuildContext context;
  //form key
  var formKey = GlobalKey<FormState>();

  //User user = new User();
  

  //constructor
  LoginPageState() {
    //intialize values
    controller = LoginController(this);
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
    //store context information in the instance variable
    this.context = context;
    //creates Scaffold
    //Scaffold is foundation app
    return Scaffold(
      //First item is Scaffold///////////////////////////////////////////////
      //center title
      appBar: AppBar(
        title: new Center(
            child: new Text(
          "Login",
          style: TextStyle(color: Color.fromARGB(250, 0, 0, 0)),
        )),
        //change color of appBar
        backgroundColor: Color.fromARGB(100, 0, 100, 255),

        //allows to add mulitle things in appbar
        actions: <Widget>[
          //represent strings
          PopupMenuButton<String>(
            //Prints selected button/popupmenuitem
            onSelected: (value) {
              //prints value of selected menu button
              print("Menu: " + value);
              //calls function
              controller.popupMenuSelected(value);
            },

            //Calls function to hand pressed button
            //onSelected: controller.popupMenuSelected,
            
            //calling from cotroller not appbar

            itemBuilder: (BuildContext context) {
              //Give menu Items in list
              return <PopupMenuEntry<String>>[
                //First item in list
                PopupMenuItem(
                  value: "Reg",
                  //how we want to display
                  child: Text("Register"),
                ),
                
              ];
            },
          )
        ],
      ),

      //Second item is Scaffold//////////////////////////////////////////////
      body: Column(
        children: <Widget>[
          //prints image
          //gets image from folders
          new Center(child: Image.asset('assets/images/pic9.jpg')),

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
                  onSaved: controller.saveEmail,
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
                  validator: controller.validatePass,
                  onSaved: controller.savePassword,
                ),

                //create Button
                RaisedButton(
                  child: Text("Login"),
                  onPressed: controller.login,
                )

              ],
            ),
          )),

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
