import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_waste/ready.dart';

import 'freshfoods.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:Colors.pink[100],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Colors.pinkAccent[100],
                margin: EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                child: ButtonTheme(
                  minWidth:150.0,
                  height: 110.0,
                  buttonColor: Colors.white,
                  child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Ready()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.pink[100], width: 1.0)),
                      child: Text(
                        "Readily Available",
                        style: TextStyle(fontSize: 18, color: Colors.pink[900]),
                      )),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Card(
                color: Colors.pinkAccent,
                margin: EdgeInsets.all(4.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                child: ButtonTheme(
                  minWidth: 150.0,
                  height: 100.0,
                  buttonColor: Colors.white,
                  child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Fresh()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.pink[100], width: 1.0)),
                      child: Text(
                        "Fresh foods",
                        style: TextStyle(fontSize: 18, color: Colors.pink[900]),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
