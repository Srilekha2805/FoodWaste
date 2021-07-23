import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_waste/models/cartmodel.dart';

import '../authentication.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  CartService _cart = new CartService();
  @override
  Widget build(BuildContext context) {
    return Center(
            child: StreamBuilder<QuerySnapshot>(
                stream: _cart.cart.doc(_cart.user.uid).collection("products").snapshots(includeMetadataChanges: true),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  return new ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        CartModel model = CartModel.fromJson(snapshot.data.docs[index].data());
                        return Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              Container(
                                height: 100.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  border: Border.all(color: Colors.purple,),
                                  ),
                                child:  Row(
                                  children: [
                                    Container(
                                      width: 100.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(topLeft:Radius.circular(20),bottomLeft:Radius.circular(20)),
                                        color: Colors.purpleAccent,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              children: [
                                                Text(model.name, style: TextStyle(fontSize:20, fontWeight: FontWeight.bold),),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 90.0),
                                                  child: Align(
                                                      alignment: Alignment.topRight,
                                                      child:IconButton(icon: Icon(Icons.delete_rounded), onPressed:(){})
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                            child: Text("Rs.${model.price}", style: TextStyle(fontSize: 15),)),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("Quantity:1 Kg", style: TextStyle(fontSize: 15),)),

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                  },
              ),
        );
  }
}


// CustomScrollView(
// slivers: [
// SliverToBoxAdapter(
// child: SizedBox(
// height: 20,
// ),
// ),
// StreamBuilder<QuerySnapshot>(
// stream: _cart.cart.doc(_cart.user.uid).collection("products").snapshots(),
// builder: (context, dataSnapshot) {
// return !dataSnapshot.hasData
// ? SliverToBoxAdapter(
// child: Center(
// child: CircularProgressIndicator(value: 40.0,)
// ),
// ) : SliverGrid(
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 1,
// mainAxisSpacing: 10.0,
// crossAxisSpacing: 10.0,
// childAspectRatio: 0.8,
// ),
// delegate: SliverChildBuilderDelegate(
// (BuildContext context, int index) {
// CartModel model = CartModel.fromJson(dataSnapshot.data.docs[index].data());
// return Padding(
// padding: const EdgeInsets.all(10.0),
// child: Container(
// height: 100,
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius.all(Radius.circular(20)),
// color: Colors.purple,
// ),
// alignment: Alignment.center,
// //
// child: Column(
// children: [
// Container(
// height: 50.0,
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius.all(Radius.circular(20)),
// color: Colors.pinkAccent[100],
// ),
// ),
// Text(model.name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
// Text(model.price, style: TextStyle(fontSize: 10), textAlign: TextAlign.left,),
// ],
// ),
// ),
// );
// },
// childCount: dataSnapshot.data.docs.length,
// )
// );
// })
// ],
// )
