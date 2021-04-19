import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
    decoration: const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end:
      Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
      colors: <Color>[
        Color(0xffc2185b),
        Color(0xffad1457),
        Color(0xff880E4F)
      ], // red to yellow
      tileMode: TileMode.repeated, // repeats the gradient over the canvas
    ),
    ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75.0,
              backgroundImage: AssetImage('assets/images/1.jpg'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome to FWM ",style: TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold,),),
                Text(" A one stop destination for \n experiencing true donation",style: TextStyle(color: Colors.white,))
              ],
            )
          ],
        ),
      )

    );
  }
}
