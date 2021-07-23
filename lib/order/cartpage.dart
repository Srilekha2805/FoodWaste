import 'package:flutter/material.dart';
import 'package:food_waste/order/cart.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("MyCart",style: TextStyle(color: Colors.white),),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed:(){
          Navigator.pop(context);
        }),
      ),
      body: Column(
        children: [
          Expanded(child: Cart()),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50.0,
            margin: EdgeInsets.all(40.0),
            child: FlatButton(
                color: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onPressed: () {
                },
                child: Text(
                  'Check Out',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                )),
          )

        ],
      ),
    );
  }
}
