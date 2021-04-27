import 'package:flutter/material.dart';

import 'grid.dart';

class Fresh extends StatefulWidget {
  @override
  _FreshState createState() => _FreshState();
}

class _FreshState extends State<Fresh> {
  TabController _controller;
  List categories = ["Vegetables", "Fruits"];
  List data=[Products(["Brinjal","Tomatoes","Onions"]),Products(["Apple","Mango","Grapes","Orange"])];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: categories.length,
        child: Scaffold(
          appBar: AppBar(
            elevation: 6.0,
            backgroundColor: Colors.pink[900],
            shape: ContinuousRectangleBorder(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(90.0),
                bottomRight: Radius.circular(90.0),
              ),),
            title: Center(child: Text("Freshfoods",style: TextStyle(color: Colors.white),)),
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
                    return (data[index] );
                  }),
                ),
              ),
            ],
          ),

        ),
    );
  }
}
