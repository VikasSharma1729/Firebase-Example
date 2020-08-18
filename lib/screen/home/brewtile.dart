import 'package:flutter/material.dart';
class BrewTile extends StatelessWidget {

  final String name;
  final int strength;
  final String sugar;

  BrewTile({this.name,this.sugar,this.strength});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
            margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[strength],
          ),
          title: Text(name),
          subtitle: Text('Take ${sugar} sugars'),
        ),
      ),
    );
  }
}