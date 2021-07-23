import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_waste/authentication.dart';
import 'package:food_waste/models/donatemodel.dart';

class MyDonation extends StatefulWidget {
  @override
  _MyDonationState createState() => _MyDonationState();
}

class _MyDonationState extends State<MyDonation> {
  DonateService _don = new DonateService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.pink[50],
      body:Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: _don.donation.doc(_don.user.uid).collection("items").snapshots(includeMetadataChanges: true),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }
            if(snapshot.data == null || snapshot.data.docs.length == 0){
                return Center(child: Text("No donations made yet!",style: TextStyle(color: Colors.grey)));
              }
            return new ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  DonateModel model = DonateModel.fromJson(snapshot.data.docs[index].data());
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
                                      child: Text(model.ItemName, style: TextStyle(fontSize:25, fontWeight: FontWeight.bold),)),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(model.Quantity, style: TextStyle(fontSize:15),)),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(model.Preparedtime, style: TextStyle(fontSize: 15),)),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(t.toString(), style: TextStyle(fontSize:10),)),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Date of Donation :$t1", style: TextStyle(fontSize: 10),)),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Status:Not Accepted yet", style: TextStyle(fontSize:15),)),
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

// CustomScrollView(
// slivers: [
// SliverToBoxAdapter(
// child: SizedBox(
// height: 20,
// ),
// ),
// StreamBuilder<QuerySnapshot>(
// stream:_don.donation.doc(_don.user.uid).collection("items").snapshots(),
// builder: (context, dataSnapshot) {
// return !dataSnapshot.hasData
// ? SliverToBoxAdapter(
// child: CircularProgressIndicator(),)
//     : SliverGrid(
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// mainAxisSpacing: 10.0,
// crossAxisSpacing: 10.0,
// childAspectRatio: 0.8,
// ),
// delegate: SliverChildBuilderDelegate(
// (BuildContext context, int index) {
// DonateModel model = DonateModel.fromJson(dataSnapshot.data.docs[index].data());
// return Padding(
// padding: const EdgeInsets.all(10.0),
// child: Container(
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
// height: 100.0,
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius.all(Radius.circular(20)),
// color: Colors.pinkAccent[100],
// ),
// ),
// Text(model.ItemName, style: TextStyle(
// fontSize: 15,
// fontWeight: FontWeight.bold),
// textAlign: TextAlign.left,),
// Text(model.Type,
// style: TextStyle(fontSize: 10),
// textAlign: TextAlign.left,),
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
