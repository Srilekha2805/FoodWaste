import 'package:flutter/material.dart';
import 'package:food_waste/profile.dart';
import 'package:food_waste/wallet/points.dart';
import 'authentication.dart';

class Sidebar extends StatelessWidget {
  final TextStyle s= TextStyle(color: Colors.white,fontSize: 20);
  bool selected=false;
  final shape=RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0))
  );
  @override
  Widget build(BuildContext context) {
    return  Drawer(

        child: Container(
          color: Colors.purple,
          child: ListView(

            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height:50,
              ),
              ListTile(
                leading: IconButton(icon:Icon(Icons.home_filled,color: Colors.white,), onPressed:(){

                }),
                title: Text('Home',style:s,),
                selected: true,
                shape: shape,
                selectedTileColor: Colors.purple[100],
              ),
              ListTile(
                leading: IconButton(icon:Icon(Icons.person,color: Colors.white,), onPressed:(){}),
                title: Text('Profile',style:s,),
                onTap: () {
                  selected=true;
                  Navigator.push(context,MaterialPageRoute(builder:(context)=>GetUserName()));
                },
                shape: shape,
                selected: selected,
                selectedTileColor: Colors.purple,
              ),
              ListTile(
                leading:IconButton(icon:Icon(Icons.monetization_on_outlined,color: Colors.white), onPressed:(){

                }),
                title: Text('Credits',style: s,),
                shape: shape,
                onTap: () {
                  selected=true;
                  Navigator.push(context,MaterialPageRoute(builder:(context)=>Points()));
                },
                selected: selected,
                selectedTileColor: Colors.purple,
              ),
              ListTile(
                leading: IconButton(icon:Icon(Icons.shop,color: Colors.white), onPressed:(){}),
                title: Text('MyOrders',style: s,),
                onTap: () {
                  selected=true;
                },
                shape: shape,
                selected: selected,
                selectedTileColor: Colors.purple,
              ),
              ListTile(
              leading: IconButton(icon:Icon(Icons.exit_to_app_sharp,color: Colors.white), onPressed:(){}),
                title: Text('Logout',style: s,),
                shape: shape,
                onTap: () {
                  signOut();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
    );
  }
}