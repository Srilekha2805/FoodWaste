import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_waste/authentication.dart';
import 'package:food_waste/models/donatemodel.dart';

import 'Accept.dart';



class OtherDonations extends StatefulWidget {
  @override
  _OtherDonationsState createState() => _OtherDonationsState();
}

class _OtherDonationsState extends State<OtherDonations> {

  DonateService _don = new DonateService();

  //where(FieldPath.documentId,isNotEqualTo:_don.user.uid)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[50],
        body:Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: _don.donation.where('__name__', isNotEqualTo:_don.user.uid).snapshots(includeMetadataChanges: true),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
              if (snapshot.data == null || snapshot.data.docs.length == 0) {
                return Center(child: Text("No active donations!!",style: TextStyle(color: Colors.grey),));
              }
              return new ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    DonateModel model = DonateModel.fromJson(snapshot.data.docs[index]['items'].data());
                    print(model);
                    print(model.uid);
                    DateTime t = model.Preparationdate.toDate();
                    DateTime t1 = model.DOD.toDate();
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            height: 150.0,
                            width: MediaQuery.of(context).size.width / 0.5,
                            decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.pink[700],
                              ),
                            ),
                            child:  Row(
                              children: [
                                Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.pink[700],
                                        borderRadius:BorderRadius.only(topLeft:Radius.circular(10.0),bottomLeft: Radius.circular(10.0),  )
                                    )
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                        alignment:Alignment.centerLeft,
                                        child: Text(model.ItemName, style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),)),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(model.Quantity, style: TextStyle(fontSize:10),)),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(t.toString(), style: TextStyle(fontSize:10),)),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(model.Preparedtime, style: TextStyle(fontSize: 10),)),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Date of Donation :$t1", style: TextStyle(fontSize: 10),)),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          children: [
                                            ButtonTheme(
                                              minWidth: 80.0,
                                              child: RaisedButton(
                                                  child:Text("Accept",style: TextStyle(color: Colors.white)),
                                                  color: Colors.green,
                                                  onPressed: (){
                                                    addCoin(model.uid,model.Quantity);
                                                    Navigator.push(context, MaterialPageRoute(builder:(context)=>Accept()));
                                                  }
                                              ),
                                            ),
                                            SizedBox(
                                              width: 30.0,
                                            ),
                                            ButtonTheme(
                                              minWidth: 60.0,
                                              child: FlatButton(
                                                  child:Text("Contact",style: TextStyle(color: Colors.white)),
                                                  color: Colors.pinkAccent,
                                                  onPressed: (){}
                                              ),
                                            )
                                          ],
                                        )),
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
        )
    );
  }
}
