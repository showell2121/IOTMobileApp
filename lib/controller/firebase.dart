import "package:firebase_auth/firebase_auth.dart";

class Firebase {


  //creates account with username and password
  static void createAccount({String email, String password}) async {

    //Firebase create account
    AuthResult auth = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

  }

  //Takes name parameters not positional
  static Future<String> login({String email, String password}) async {

    //User signin into firebase
    AuthResult auth = await FirebaseAuth.instance
    .signInWithEmailAndPassword(email: email, password: password);

    return auth.user.uid;
  }




}//End Class
