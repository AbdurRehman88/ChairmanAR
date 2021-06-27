import 'package:blood_donation/Admin/EditUsers.dart';
import 'package:blood_donation/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'Admin/AdminDashboard.dart';
import 'loginScreen.dart';

class UserManagement{
  Widget handleAuth(){
    return new StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context,snapshot){
        if(snapshot.hasData){
          return DashboardPage();
        }
        return LoginScreen();
      }
    );
  }


  authorizedAccess(BuildContext context){
    FirebaseAuth.instance.currentUser().then((Users){
      Firestore.instance.collection('Users').where('uid', isEqualTo:Users.uid).getDocuments().then((docs){
        if(docs.document[0].exits){
          if(docs.document[0].data['role']=='admin'){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AdminPanel()));
          }
          else{
            print('not Authorized');
          }
        }
      });
    });

  }
}