import "package:firebase_auth/firebase_auth.dart";

import "package:cloud_firestore/cloud_firestore.dart";

import "../model/regUser.dart";

class Firebase {


  //creates account with username and password
  static Future<bool> createAccount(RegUser user) async {

    try{     

      //Push to firestore
      await Firestore.instance.collection("userInfo").document().setData(
        {
          "city":user.city,
          "email": user.email,
          "phoneNumber": user.phone,
          "state": user.state, 
          "terms": "on",
          "timestamp": DateTime.now().toUtc().millisecondsSinceEpoch
      });

      //Firebase create account
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: user.email, password: user.password);

    }catch(err){

      return false;
    }

    return true;
       

  }

  //Takes name parameters not positional
  static Future<String> login({String email, String password}) async {

    //User signin into firebase
    AuthResult auth = await FirebaseAuth.instance
    .signInWithEmailAndPassword(email: email, password: password);

    return auth.user.uid;
  }

 




}//End Class
