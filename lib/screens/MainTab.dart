import 'package:flutter/material.dart';

class MainTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, size) {
      return Container(
        color: Colors.white,
        child: Container(
        //  color: Colors.green,
          height: 10,
        ),
        /* child: Card(
          color: Colors.red,
          elevation: 100,
          child: ListTile(
              title: Text("Articl Title"),
              subtitle: Text("some details"),
              leading: IconButton(
                  icon: Icon(Icons.favorite_border, color: Colors.red)))),*/
      );
    });
  }
}
