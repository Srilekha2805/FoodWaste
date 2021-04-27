import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


FirebaseAuth _auth=FirebaseAuth.instance;

Future<bool> register(String email, String password,String name,String phone,String gender) async {
  String n=name;
  String ph=phone;
  String ge=gender;
  User firebaseUser;
  try {

    await _auth.createUserWithEmailAndPassword(email: email, password: password).
    then((auth) => firebaseUser=_auth.currentUser);
    if(firebaseUser!=null)
      {
        saveinfo(firebaseUser,n,ph,ge);
      }
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }

}

Future saveinfo(User fUser,String n,String ph,String ge) async {
  FirebaseFirestore.instance.collection("users").doc(fUser.uid).set(
      {
        "uid":fUser.uid,
        "name": n,
        "email":fUser.email,
        "contact":ph,
        "Gender":ge

      }
  );
}

Future<bool> signIn(String email, String password) async {
  try {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}