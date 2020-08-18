
import 'package:brewcrew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brewcrew/shared/shared.dart';


class SigIn extends StatefulWidget {

  Function toggless ;
  SigIn({this.toggless});


  @override
  _SigInState createState() => _SigInState();
}

class _SigInState extends State<SigIn> {

  final AuthService _auth = AuthService();
  String email = '';
  String password = '';

  final _form = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
        title: new Text('Brew Crew'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,

        actions: <Widget>[

          FlatButton.icon(
            icon: Icon(Icons.person),
            label: new Text('Register'),
            onPressed: (){

              widget.toggless();

            },
          )
        ],
        
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[

              SizedBox(height: 12.0,),
              TextFormField(
                decoration: Shared().decorationforform.copyWith(hintText: 'Email') ,
                onChanged: (value){
                  setState(() {
                   email = value; 
                  });
                },

              ),
              SizedBox(height: 12.0,),

              TextFormField(
                decoration: Shared().decorationforform.copyWith(hintText: 'Password') ,
                onChanged: (value){
                    setState(() {
                     password = value; 
                    });
                },
              ),
              
              RaisedButton(
                child: Text('Sign in'),
                onPressed: () async {

                    dynamic result = await _auth.signinWithEmailAndPassword(email, password);
                    if(result ==null){

                      print('Something is wrong');
                    }

                },
              ),
            ],


          ),



        )
      ),
    );
  }
}