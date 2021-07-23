import 'package:flutter/material.dart';
import 'file:///E:/Android/food_waste/lib/donate/new1.dart';

class Donate extends StatefulWidget {
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  String type;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end:
          Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
          colors: <Color>[
            Color(0xffc2185b),
            Color(0xffad1457),
            Color(0xff880E4F)
          ], // red to yellow
          tileMode: TileMode.mirror, // repeats the gradient over the canvas
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonTheme(
                minWidth: 160.0,
                height: 40.0,
                buttonColor: Colors.white60,
                focusColor: Colors.pinkAccent,
                child: RaisedButton(
                  onPressed: (){
                    type="food";
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Quantity(type)));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.pink[900],width: 1.0)
                  ),
                  child: Text(
                    "Food",
                    style: TextStyle(fontSize: 22,color: Colors.black87,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonTheme(
                minWidth: 160.0,
                height: 40.0,
                buttonColor: Colors.white60,
                focusColor: Colors.pinkAccent,
                child: RaisedButton(
                  onPressed: (){
                    type="Vegetable";
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Quantity(type)));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.pink[900],width: 1.0)
                  ),
                  child: Text(
                    "Vegetable",
                    style: TextStyle(fontSize: 22,color: Colors.black87,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonTheme(
                minWidth: 160.0,
                height: 40.0,
                buttonColor: Colors.white60,
                focusColor: Colors.pinkAccent,
                child: RaisedButton(
                  onPressed: (){
                    type="Fruits";
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Quantity(type)));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.pink[900],width: 1.0)
                  ),
                  child: Text(
                    "Fruits",
                    style: TextStyle(fontSize: 22,color: Colors.black87,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
