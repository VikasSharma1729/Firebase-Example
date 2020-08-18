
import 'package:brewcrew/modals/user.dart';
import 'package:brewcrew/screen/authenticate/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/home/home.dart';


class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    //return either home or authenticate
    if(user == null){
      return Authenticate();
    }
    else {
      return Home();
    }
    
  }
}