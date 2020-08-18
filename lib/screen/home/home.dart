import 'package:brewcrew/modals/brew.dart';
import 'package:brewcrew/screen/home/brewlist.dart';
import 'package:brewcrew/screen/home/settingsform.dart';
import 'package:brewcrew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brewcrew/services/database.dart';
import 'package:provider/provider.dart';
class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  
  @override

  

  Widget build(BuildContext context) {

    void _showSettingpanel(){

    showModalBottomSheet(context: context,builder: (context){
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
        child: SettingForm(),
      );
    });

  }



    return StreamProvider<List<Brew>>.value(
      
      value: DatabaseService().brews,
          child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: new Text('Crew Brew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,

          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: new Text('Sign Out'),
              onPressed: ()async{

                await _auth.signout();

              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: ()=> _showSettingpanel(),
            )

          ],
        ),
        body: BrewList(),

      ),
    );
  }
}