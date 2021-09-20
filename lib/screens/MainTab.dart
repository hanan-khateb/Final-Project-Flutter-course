import 'package:depression_treatment/screens/OneArticleInformation.dart';
import 'package:flutter/material.dart';

class MainTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext builder, int index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(OneArticleInformation.id);
                },
                child: Card(
                    // elevation: 100,
                    child: ListTile(
                  title: Text("Articl Title"),
                  subtitle: Text("some details"),
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    ),
                  ),
                )),
              );
            }));
  }
}
