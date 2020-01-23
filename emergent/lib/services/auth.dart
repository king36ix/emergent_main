import 'package:firebase_auth/firebase_auth.dart';
//import 'package:emergent/screens/authenticate/register.dart';
import 'package:emergent/services/database.dart';
import 'package:emergent/models/user.dart';

import '../models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//create use obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
//        .map((FirebaseUser user) => _userFromFirebaseUser(user));
    //shows change in user sign in/out
        .map(_userFromFirebaseUser); //implicit of the above
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign in with email and password
Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result =await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;//converts firebase user to regular user
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result =await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user =result.user;

      //create a new document for the user with the user's uid
      await DatabaseService(uid:user.uid).updateUserData('0', 'Kenya', 'abc', 'Truck', 'KAT');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign out
  Future signOut() async {
    try {
//      User(uid:null);
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
