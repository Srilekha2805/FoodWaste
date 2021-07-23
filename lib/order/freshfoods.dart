import 'package:flutter/material.dart';
import 'package:food_waste/order/cart.dart';
import 'package:food_waste/order/cartpage.dart';
import 'package:food_waste/sidebar.dart';

import 'grid.dart';


class Fresh extends StatefulWidget {
  @override
  _FreshState createState() => _FreshState();
}

class _FreshState extends State<Fresh> {

  List categories = ["Vegetables", "Fruits"];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: categories.length,
        child: Scaffold(
          appBar: AppBar(
            elevation: 6.0,
            leading: IconButton(icon: Icon(Icons.menu,color: Colors.white,),
              onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Sidebar()));
              },

            ),
            backgroundColor: Colors.purpleAccent[700],
            title: Center(child: Text("Freshfoods",style: TextStyle(color: Colors.white),)),
            actions: [
              IconButton(icon:Icon(Icons.notifications,color: Colors.white), onPressed:(){}),
              IconButton(icon:Icon(Icons.shopping_cart_rounded,color: Colors.white),
                  onPressed:(){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>CartPage()));
                  })
            ],
          ),
          body: Column(
            children: [
             
              TabBar(
                isScrollable: true,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                tabs: List<Widget>.generate(categories.length, (int index) {
                  return new Tab(text: categories[index]);
                }),
              ),
              Expanded(
                child: new TabBarView(
                  children: List<Widget>.generate(
                      categories.length, (int index) {
                    return GridItem(categories[index]);
                  }),
                ),
              ),
            ],
          ),

        ),
    );
  }
}
