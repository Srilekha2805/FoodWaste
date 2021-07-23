

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


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
        "Gender":ge,
        "coins":"0.0",

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

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}


class CartService{
  CollectionReference cart= FirebaseFirestore.instance.collection("cart");
  User user=_auth.currentUser;

  Future<void> addtocart(document){
    return cart.doc(user.uid).collection("products").add({
      "pid": document.id,
      "name": document.name,
      "price": document.price,
    });
  }

  // Future<void> deletefromcart(String pid){
  //   cart.doc(user.uid).collection("products").where(pid,isEqualTo: );
  // }

}

class DonateService{
  CollectionReference donation= FirebaseFirestore.instance.collection('donation');
  User user=_auth.currentUser;

  Future<void> donate(User fUser,String n,String ty,String ph,DateTime d,TimeOfDay t) async {
    return donation.doc(fUser.uid).collection("items").add(
        {
          "ItemName": n,
          "Type": ty,
          "Quantity":ph,
          "Preparationdate":d,
          "Preparedtime":t.toString(),
          "DOD":DateTime.now(),
          "uid":fUser.uid
        }
        );
   }
}

Future<bool> addCoin(String id, String amount) async {
  try {
    var value = double.parse(amount);
    DocumentReference documentReference = FirebaseFirestore.instance.collection('users').doc(id);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({'coins': value});
        return true;
      }
      double newAmount = double.parse(snapshot.data()['coins'] )+ value ;
      transaction.update(documentReference, {'coins': newAmount.toString()});
      print("updated");
      return true;
    });
    return true;
  } catch (e) {
    print("failed"+e);
    return false;

  }
}

Future<bool> removeCoin(String id) async {
  String uid = _auth.currentUser.uid;
  FirebaseFirestore.instance.collection('Coins').doc(uid).collection('Credits').doc(id).delete();
  return true;
}
