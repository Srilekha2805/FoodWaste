import 'package:flutter/material.dart';
import 'package:food_waste/order/mydonation.dart';

import 'OtherDonations.dart';

class Ready extends StatefulWidget {
  @override
  _ReadyState createState() => _ReadyState();
}

class _ReadyState extends State<Ready> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[700],
        title:Text("Donations"),
        leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:()
            {
              Navigator.pop(context);
            }
        ),
      ),
      body: Column(
        children: [
          Container(
              height:30,
              child: Text("Your Donations",)),
          Expanded(
              child: MyDonation()
          ),
          Container(
              height:30,
              child: Text("Available Donations")),
          Expanded(
             child: OtherDonations(),
              )
        ],
      ),
    );
  }
}


