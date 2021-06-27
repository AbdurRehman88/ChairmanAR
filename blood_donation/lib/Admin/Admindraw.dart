import 'package:flutter/material.dart';

import 'CurrentUsers.dart';


class AdminDrawer extends StatelessWidget {
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
            title: Text("User-Blood-Request"),
            subtitle: Text("The Blood-Request Page"),
            onTap: () {
              Navigator.pushNamed(context, 'UserRequest');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              size: 40,
              color: Colors.indigo,
            ),
            title: Text("DonorList"),
            subtitle: Text("Check Blood_Donors"),
            onTap: () {
              Navigator.pushNamed(context, 'UserDonors');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.contact_phone,
              size: 40,
              color: Colors.indigo,
            ),
            title: Text(
              "User",
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text("User page of this app", style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CurrentUser()));
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
              Navigator.pushNamed(context, 'splash');
            },
          ),
        ],
      ),
    );
  }
}
