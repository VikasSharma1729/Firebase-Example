import 'package:brewcrew/services/auth.dart';
import 'package:brewcrew/shared/shared.dart';
import 'package:flutter/material.dart';
class Register extends StatefulWidget {

  Function toggless ;
  Register({this.toggless});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _form = GlobalKey<FormState>();

  String email = '';
  String password = '';

  final AuthService _auth = AuthService();
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
            label: new Text('Sign Up'),
            onPressed: (){

              widget.toggless();

            },
          )
        ],
        
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child:Form(
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
                child: Text('Sign up'),
                onPressed: () async{

                   dynamic result = await _auth.signupWithEmailAndPassword(email, password);
                    
                   if(result == null){
                     print('In the resister form something is wrong ');
                   }

                },
              )

              

            ],
          ),
        )
      ),
    );
  }
}