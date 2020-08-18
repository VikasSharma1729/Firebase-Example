import 'package:brewcrew/modals/user.dart';
import 'package:brewcrew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';


class AuthService with ChangeNotifier{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userfromFirebaseUser(FirebaseUser user){

    return user!=null ? User(uid: user.uid) :null ;
  }
  //stream

  Stream<User> get user{

    return _auth.onAuthStateChanged.map((FirebaseUser user)=>_userfromFirebaseUser(user));

  }


  //sign in Anon

  Future signInAnonmousl() async{
     
     try{

       AuthResult result =  await _auth.signInAnonymously();
       
       FirebaseUser user = result.user;

       return _userfromFirebaseUser(user);
     }
     catch(e){

        print('You are having some error');
        return null;

     }

  }

  //sign in with email and password

  Future signinWithEmailAndPassword(String email , String password) async{

    try{

 AuthResult result = await _auth.signInWithEmailAndPassword(email: email,password: password);

    FirebaseUser user = result.user;

    return _userfromFirebaseUser(user);


    }
    catch(e) {

      print('Something is wrong in Sign In function');
      return null;
    }
   


  }


  //register with email and password

  Future signupWithEmailAndPassword(String email,String password) async{

    try{

         AuthResult result = await _auth.createUserWithEmailAndPassword(email:email,password: password);
         FirebaseUser user = result.user;

         await DatabaseService(uid: user.uid).updateUserData('0', 'new crew member', 100);
         return _userfromFirebaseUser(user);

    }

    catch(e){

      print('Something is missing');
      print(e.toString());
      return null;
      

    }
 



  }



  //signOut

  Future signout() async {
    try{
      return await _auth.signOut();

    }
    catch(e){

      print(e.toString());
      return null;

    }
    
  }

}