import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  List product;
  Products(this.product);
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.8,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.pinkAccent[100 * (index % 9)],
                    ),
                    alignment: Alignment.center,

                    child: Text(widget.product[index]),
                  ),
                );
              },
              childCount:widget.product.length,
            ),
          ),
        ],
    );
  }
}
