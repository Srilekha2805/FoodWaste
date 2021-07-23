import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'api_work.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class Points extends StatefulWidget {
  @override
  _PointsState createState() => _PointsState();
}

class _PointsState extends State<Points> {
  double bitcoin = 0.0;

   @override
  initState() {
    updateValues();
  }

  updateValues() async {
    bitcoin = await getPrice();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    getValue(double amount) {
      return ((bitcoin * amount)/40000).toStringAsFixed(2);
    } 

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[700],
        title:Text("My Credits"),
        leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:()
            {
              Navigator.pop(context);
            }
        ),
      ),
      body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('users').doc(_auth.currentUser.uid).snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return new Text("Loading");
                    }
                    var userDocument = snapshot.data;

                    return Column(
                      children: [
                    Center(
                      child: Lottie.asset('assets/bitcoin.json', repeat: true, reverse: false, animate: true, height: 300),
                    ),
                        Text("Current credits available are: \n Rs ${getValue(double.parse(userDocument["coins"]))}",style: TextStyle(fontSize:20),),
                      ],
                    );
                  }
              )
          )
      ),
    );
  }

}

//