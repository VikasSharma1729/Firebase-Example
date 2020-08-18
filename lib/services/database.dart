import 'package:brewcrew/modals/brew.dart';
import 'package:brewcrew/modals/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService with ChangeNotifier{

  final String uid;

  DatabaseService({this.uid});

  //colection reference
  final CollectionReference brewCollection = Firestore.instance.collection('brews');

  Future updateUserData(String sugars,String name,int strength) async {

    return await brewCollection.document(uid).setData({
      'sugars':sugars,
      'name' : name,
      'strength': strength
    });

  }

  List<Brew> _brewListfromSnapShot(QuerySnapshot snapshot){

    return snapshot.documents.map((dox){
      return Brew(
        name: dox.data['name'] ?? '',
        sugar: dox.data['sugars'] ?? '0',
        strength: dox.data['strength'] ?? 0,
        
      );
    }).toList();
  }


  Stream<List<Brew>> get brews{

    return brewCollection.snapshots().map(_brewListfromSnapShot);
  }

  //userdata from snapshot

  UserData _userdatafromsnapshow(DocumentSnapshot snapshow){

    return UserData(
      uid: uid,
      name: snapshow.data['name'],
      strength: snapshow.data['strength'],
      sugar: snapshow.data['sugars']
      );
  }
  //get user doc stream

  Stream <UserData> get userData{

    return brewCollection.document(uid).snapshots().map(_userdatafromsnapshow);
  }
}