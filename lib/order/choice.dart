import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_waste/order/ready.dart';
import 'freshfoods.dart';

class Choice extends StatefulWidget {
  @override
  _ChoiceState createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  final Shader linearGradient = LinearGradient(colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],)
      .createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:Colors.white,
        appBar: AppBar(
          title: Text("Featured choices",style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              foreground: Paint()..shader = linearGradient
          ),
          ),
          backgroundColor:Colors.pink[100],
          shape: ContinuousRectangleBorder(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(90.0),
              bottomRight: Radius.circular(90.0),
            ),),
          leading: IconButton(icon:Icon(Icons.arrow_back),color: Colors.white,
            onPressed: () { Navigator.pop(context);},),
        ),
        body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
                        Colors.purple,
                        Colors.pink[600]
                      ])),
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(children: [
                        Text('Readily Available\n',
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            )),
                        Text('Check out your donations and other donated foods\n',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ), onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Ready()));
                              },),
                              decoration: BoxDecoration(
                                // You can use like this way or like the below line
                                borderRadius: new BorderRadius.circular(30.0),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                            ))
                      ])),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
                        Colors.pink[600],
                        Colors.purple
                      ])),
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(children: [
                        Text('FreshFoods\n',
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            )),
                        Text('Order fresh vegetables and fruits\n',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Fresh()));},),
                              decoration: BoxDecoration(
                                // You can use like this way or like the below line
                                borderRadius: new BorderRadius.circular(30.0),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                            ))
                      ])),
                ),
              )
            ])
      ),
    );
  }
}

