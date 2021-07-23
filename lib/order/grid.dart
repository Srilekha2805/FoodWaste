import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_waste/authentication.dart';

import '../models/products.dart';


class GridItem extends StatefulWidget {
  String category;
  GridItem(this.category);
  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {

  CollectionReference users = FirebaseFirestore.instance.collection("Category");
  CartService cart=new CartService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: users.doc(widget.category).collection("Products").snapshots(includeMetadataChanges: true),
              builder: (context, dataSnapshot) {
                return !dataSnapshot.hasData
                    ? SliverToBoxAdapter(
                  child: Center(
                      child: CircularProgressIndicator(value: 40.0,)
                  ),
                ) : SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 0.8,
                    ),
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        Product model = Product.fromJson(dataSnapshot.data.docs[index].data());
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border: Border.all(color: Colors.purple,width: 2.0),
                            ),
                            alignment: Alignment.center,
                            //
                            child: Column(
                              children: [
                                Container(
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                    color: Colors.pinkAccent[100],
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      model.id,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    )),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      model.name,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    )),
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      model.price.toString(),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    )),
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: ClipOval(
                                      child: Material(
                                        color: Colors.purple,
                                        child: InkWell(
                                          splashColor: Colors.red,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                              ),
                                              width: 50,
                                              height: 50,
                                              child:IconButton(icon: Icon(Icons.add,color: Colors.white,),onPressed:(){
                                                cart.addtocart(model);
                                              },)),
                                        ),
                                      ),
                                    )
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: dataSnapshot.data.docs.length,
                    )
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}




