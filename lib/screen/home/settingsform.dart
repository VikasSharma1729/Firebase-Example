import 'package:brewcrew/modals/user.dart';
import 'package:brewcrew/services/database.dart';
import 'package:brewcrew/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {


  final _form = GlobalKey<FormState>();
  final List<String> sugars = ['0','1','2','3','4','5'];


  String _currentName;
  String _currentSugar;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid:user.uid).userData,
      builder: (context, snapshot) {

        if(snapshot.hasData){

            UserData userData = snapshot.data;
              return SingleChildScrollView(
                  child: Form(
                  key:_form ,
                  child: Column(
                      children: <Widget>[

                        Text('Update your brew Settings',style: TextStyle(fontSize: 18.0),),

                        SizedBox(height: 20.0,),

                        TextFormField(
                          initialValue: userData.name,
                          validator: (value) => value.isEmpty ? 'Enter a valid name' : null,
                          decoration: Shared().decorationforform,
                          onChanged: (value){
                            setState(() {
                            _currentName = value; 
                            });
                          },

                        ),
                        SizedBox(height: 20.0,),

                        //dropdown

                        DropdownButtonFormField(
                          decoration: Shared().decorationforform,
                          value: _currentSugar ?? userData.sugar,
                          onChanged: (value){
                            setState(() {
                            _currentSugar = value; 
                            });
                          },
                          items: sugars.map((sugar){
                            return DropdownMenuItem(

                              value: sugar,
                              child: Text('$sugar sugars'),
                            );
                          }).toList(),
                        ),


                        //slider
                        Slider(
                          
                          
                          min: 100,
                          max: 900,
                          divisions: 8,
                          activeColor: Colors.brown[_currentStrength ?? userData.strength],
                          inactiveColor: Colors.brown[_currentStrength ?? userData.strength],

                          onChanged: (value){
                            setState(() {
                            _currentStrength = value.toInt(); 
                            });
                          },
                          label: 'Strength',
                          value: (_currentStrength ?? 100).toDouble(),
                        ),


                        //button
                        RaisedButton(
                          child: Text('Update'),
                          onPressed: () async {
                           
                            if(_form.currentState.validate()){
                              await DatabaseService(uid: user.uid).updateUserData(
                                _currentSugar ?? userData.sugar,
                                _currentName ?? userData.name,
                                _currentStrength ??userData.strength
                              );
                              Navigator.pop(context);
                            }

                          },
                        )


                      ],

                  ),

            ),
              );

        }
        else{


        }
       
      }
    );
  }
}