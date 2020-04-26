//import flutter
//Iphone stytle design , This import is not needed
import 'package:flutter/cupertino.dart';
//google style desing
import 'package:flutter/material.dart';
//Youtube
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

//imports controller
import "../controller/homepageController.dart";

//Youtube

//create class
class HomePage extends StatefulWidget {
  //manditory override
  @override
  State<StatefulWidget> createState() {
    //return function
    return HomePageState();
  }
}

//creates class
//This is the current state of the page
class HomePageState extends State<HomePage> {
  //variables
  HomePageController controller;

  var selectedSalutation;

  //form key
  var formKey = GlobalKey<FormState>();

  //cant send message
  var message = "";

  //amount
  int amount = -6;

  //Youtube
  YoutubePlayerController _controller;

  //constructor
  HomePageState() {
    //intialize values
    controller = HomePageController(this);
  }

  //set state method to update screen
  //takes function as param
  void stateChanged(Function f) {
    //actually sets the state of the page and refreshes
    setState(f);
  }

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: "v1wunhYRmtI",
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: true,
        isLive: false,
        forceHideAnnotation: true,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  //manditory override
  @override
  Widget build(BuildContext context) {
    //creates Scaffold
    //Scaffold is foundation app
    return Scaffold(
      //First item is Scaffold///////////////////////////////////////////////
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          //Three
          //generic
          // PopupMenuButton(
          //represent strings
          PopupMenuButton<String>(
            //New, version 2, calling from controller
            //functions for menu are stored in controller
            onSelected: controller.popupMenuSelected,
            itemBuilder: controller.showPopupMenu,
          ),
        ],
      ),

      //Second item is Scaffold//////////////////////////////////////////////
      body: Column(
        children: <Widget>[

          //Playes youtube video. 
          YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              topActions: <Widget>[
                SizedBox(width: 8.0),
                Expanded(
                    child: Text(
                  "Automatic Cat Feeder",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ))
              ]),

          //Form
          Form(
              key: formKey,
              child: Expanded(
                child: ListView(
                  children: <Widget>[
                    //Create text field for AmountOfFood
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Text(
                            "Amount: ",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          hintText: "Number Of Cats"),
                      keyboardType: TextInputType.number,
                      validator: controller.validateAmount,
                      onSaved: controller.saveAmount,
                      autocorrect: false,
                    ),

                    // DropdownButtonFormField<String>(
                    //   value: selectedSalutation,
                    //   icon: Text("jflksjdf"),
                    //   hint: Text(
                    //     'State',
                    //   ),
                    //   onChanged: (salutation) =>
                    //       setState(() => selectedSalutation = salutation),
                    //   //onSaved: controller.saveState,
                    //   //validator: controller.validateState,
                    //   items: ["Indiana", "Wisconsin", 'Wyoming']
                    //       .map<DropdownMenuItem<String>>((String value) {
                    //     return DropdownMenuItem<String>(
                    //       value: value,
                    //       child: Text(value),
                    //     );
                    //   }).toList(),
                    // ),

                    // //Create textfield for Timed
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //       icon: Text("Timed: ", style: TextStyle(fontSize: 18,),), hintText: "Food Amout"),
                    //   keyboardType: TextInputType.number,
                    //   //validator: controller.validateEmail,
                    //   //onSaved: controller.saveEmail,
                    //   autocorrect: false,
                    // ),

                    // TextFormField(
                    //   decoration: InputDecoration(
                    //       icon: Text("Hours: ", style: TextStyle(fontSize: 18,),), hintText: "Time To Feed"),
                    //   keyboardType: TextInputType.datetime,
                    //   //validator: controller.validateEmail,
                    //   //onSaved: controller.saveEmail,
                    //   autocorrect: false,
                    // ),

                    Center(
                      child: Text(
                        message,
                        style: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
                      ),
                    ),

                    //create Button
                    RaisedButton(
                      child: Text(
                        "Feed",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(100, 0, 100, 255)),
                      ),
                      onPressed: controller.login,
                    )
                  ],
                ),
              )),

          // Row(children: <Widget>[
          //   Expanded(
          //       child: TextFormField(
          //     decoration: InputDecoration(
          //         icon: Text(
          //           "Amount: ",
          //           style: TextStyle(
          //             fontSize: 18,
          //           ),
          //         ),
          //         hintText: "Food Amount"),
          //     keyboardType: TextInputType.number,
          //     validator: controller.validateAmount,
          //     //onSaved: controller.saveEmail,
          //     autocorrect: false,
          //   )),
          //   Expanded(
          //     child: DropdownButtonFormField<String>(
          //       value: selectedSalutation,
          //       icon: Text("jflksjdf"),
          //       hint: Text(
          //         'State',
          //       ),
          //       onChanged: (salutation) =>
          //           setState(() => selectedSalutation = salutation),
          //       //onSaved: controller.saveState,
          //       //validator: controller.validateState,
          //       items: ["Indiana", "Wisconsin", 'Wyoming']
          //           .map<DropdownMenuItem<String>>((String value) {
          //         return DropdownMenuItem<String>(
          //           value: value,
          //           child: Text(value),
          //         );
          //       }).toList(),
          //     ),
          //   ),
          // ]),

          // Expanded(
          //   child:DropdownButton<String>(
          //     items:["Hello", "hello"].map((String value){
          //       return DropdownMenuItem<String>(
          //         value: value,
          //         child: Text(value),
          //       );
          //     }).toList(),
          //  value : 'Rupee',
          //   )
          //   ),

          // Expanded(
          //   child: DropdownButtonFormField<String>(
          //     value: selectedSalutation,
          //     icon: Text("jflksjdf"),
          //     hint: Text(
          //       'State',
          //     ),
          //     onChanged: (salutation) =>
          //         setState(() => selectedSalutation = salutation),
          //     //onSaved: controller.saveState,
          //     //validator: controller.validateState,
          //     items: ["Indiana", "Wisconsin", 'Wyoming']
          //         .map<DropdownMenuItem<String>>((String value) {
          //       return DropdownMenuItem<String>(
          //         value: value,
          //         child: Text(value),
          //       );
          //     }).toList(),
          //   ),
          // ),

          //Column Second item
          //first row
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     //First row button
          //     //Column first item
          //     Text(
          //       "Amout: ",
          //       style: TextStyle(fontSize: 20),
          //     ),

          //     //Second row button
          //     //Column first item
          //     Text(
          //       "Count = " + count.toString(),
          //       style: TextStyle(fontSize: 20),
          //     ),

          //     ////////////////////End of ROW////////////////////////
          //   ],
          // ),
          ///////////////////////////End of Col///////////////
        ],
      ),
    );
  }
}
