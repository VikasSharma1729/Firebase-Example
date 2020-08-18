import 'package:brewcrew/screen/authenticate/register.dart';
import 'package:brewcrew/screen/authenticate/signin.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool  _showsignIn = true;

  void toggleswitchforsigninandsignup(){

    setState(() {
     _showsignIn = !_showsignIn; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showsignIn ? SigIn(toggless: toggleswitchforsigninandsignup) : Register(toggless: toggleswitchforsigninandsignup);
  }
} 