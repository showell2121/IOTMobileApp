import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iotfinal/view/homepage.dart';


//Popup menu, list of different menus
const POPUPMENULIST = [
  'Registration',
  'Profile',
  "Search",
];

class HomePageController {
  HomePageState state;

  // //constructor
  // HomePageController(value){
  //   this.state = value;
  // }

  //short hand notation of above code
  //constructor
  HomePageController(this.state);

  //Increase Count
  void upButton() {
    // print("count: " + state.count.toString());

    //calls the state chnage method, param has to be function
    //passes annoymous function and the function increments count
    state.stateChanged(() {
      //incremnet
      ++state.count;
    });
  }

  //Decrease Count
  void downButton() {
    // print("count: " + state.count.toString());

    //calls the state chnage method, param has to be function
    //passes annoymous function and the function decrements count
    state.stateChanged(() {
      //decrement
      --state.count;
    });
  }

//function called to homepage.dart to assist with menu
  List<PopupMenuEntry<String>> showPopupMenu(BuildContext context) {
    //How map function works
    //like an forEach method
    //var list = ["seth","Alex","Ben",1,3,5,];
    // //each value in the list is applied to func1
    // //then all the result are created in to a List. .toList();
    // var p = list.map(func1).toList();
    // //print list
    // print(p);

    //   func1(var i){
    // return i;   }
    ///////////////////////////////////////////////////////////Short hand of above
    //short hand notation for calling function etc
    // p = list.map((var value)=> value).toList();
    // //print list
    // print(p);

    //New menu loops through all the menus that is declared at teh top of file
    //creates no name function.
    return POPUPMENULIST.map((item) {
      return PopupMenuItem(
        value: item,
        child: Text(item),
      );
    }).toList();

    //old hard coded menu
    // return <PopupMenuEntry<String>>[

    //   PopupMenuItem(
    //     value: "one",
    //     //how we want to display
    //     child: Text("ONE"),
    //   ),

    //   PopupMenuItem(
    //     value: 'two',
    //     //how we want to display
    //     child: Icon(Icons.filter_2),
    //   ),

    //   PopupMenuItem(
    //     value: "three",
    //     //how we want to display
    //     child: Text("THREE"),
    //   ),

    // ];
  } // End showPopuMenu

//function called to homepage.dart to assist with menu
  void popupMenuSelected(String value) {
    print("Menu: " + value);
  }
} //End Controller
