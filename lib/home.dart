import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///E:/Android/food_waste/lib/order/choice.dart';
import 'file:///E:/Android/food_waste/lib/donate/donatetype.dart';
import 'package:lottie/lottie.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end:
          Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
          colors: <Color>[
            Color(0xFFFFFFFF),
            Color(0xFFFFFFFF)
          ], // red to yellow
          tileMode: TileMode.mirror, // repeats the gradient over the canvas
        ),
      ),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             CircleAvatar(
              radius: 40.0,
               backgroundImage: AssetImage('assets/images/3.jpg'),
             ),
           ],
         ),

         Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             ButtonTheme(
               minWidth: 160.0,
               height: 40.0,
               buttonColor: Colors.white,
               focusColor: Colors.pinkAccent,
               child: RaisedButton(
                 onPressed: (){
                   Navigator.push(context,
                   MaterialPageRoute(builder: (context) => Donate()));
                 },
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10.0),
                   side: BorderSide(color: Colors.pink[900],width: 1.0)
                 ),
                 child: Text(
                   "Donate",
                   style: TextStyle(fontSize: 22,color: Colors.pink[900]),
                 ),
               ),
             )
           ],
         ),
         Center(
           child: Lottie.asset(
             'assets/cooking.json',
             repeat: true,
             reverse: false,
             animate: true,
             height: 300
           ),
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             ButtonTheme(
               minWidth: 160.0,
               height: 40.0,
               buttonColor: Colors.white,
               focusColor: Colors.pinkAccent,
               child: RaisedButton(
                 onPressed: (){
                   Navigator.push(context,
                       MaterialPageRoute(builder: (context) => Choice()));
                 },
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10.0),
                     side: BorderSide(color: Colors.pink[900],width: 1.0)
                 ),
                 child: Text(
                   "Order",
                   style: TextStyle(fontSize: 22,color: Colors.pink[900]),
                 ),
               ),
             )
           ],
         ),

         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             CircleAvatar(
               radius: 40.0,
               backgroundImage: AssetImage('assets/images/3.jpg'),
             ),
           ],
         ),
       ],
     ),
    );
  }
}
