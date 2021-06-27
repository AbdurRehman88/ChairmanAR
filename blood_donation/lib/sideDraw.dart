import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'loginScreen.dart';


class SideDraw extends StatefulWidget {
  @override
  _SideDrawState createState() => _SideDrawState();
}

class _SideDrawState extends State<SideDraw> {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'profile');
              },
              child: Column(
                children: <Widget>[
                  Container(
                    height: 113,
                    width: 113,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(
                        image: ExactAssetImage('assets/profilepic.png'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Ali',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              size: 40,
              color: Colors.indigo,
            ),
            trailing: Icon(Icons.edit),
            title: Text("Home"),
            subtitle: Text("The Home Page of this application."),
            onTap: () {
              Navigator.pushNamed(context, 'dashboard');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              size: 40,
              color: Colors.indigo,
            ),
            title: Text("Profile"),
            subtitle: Text("Check Your Profile and health details."),
            onTap: () {
              Navigator.pushNamed(context, 'profile');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.contact_phone,
              size: 40,
              color: Colors.indigo,
            ),
            title: Text(
              "AdminPanel",
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text("Do you want to know about us", style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'Admin');
            },
          ),



          ListTile(
            leading: Icon(
              Icons.backspace,
              size: 40,
              color: Colors.indigo,
            ),
            title: Text("Log Out"),
            subtitle: Text("End your session."),
            onTap: () {
              _signOut().whenComplete(() =>  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen())));
            },
          ),
        ],
      ),
    );
  }
}

