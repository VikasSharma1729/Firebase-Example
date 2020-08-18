
import 'package:brewcrew/modals/brew.dart';
import 'package:brewcrew/screen/home/brewtile.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {

    final brews = Provider.of<List<Brew>>(context) ?? [];

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context,index){

        return BrewTile(
          name: brews[index].name,
          strength: brews[index].strength,
          sugar: brews[index].sugar);
      },
    );
  }
}