import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'EditBloodRequest.dart';
import 'EditDoners.dart';
import 'EditUsers.dart';

class CurrentUser extends StatelessWidget {

  final ref = FirebaseFirestore.instance.collection('Users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        backgroundColor: Colors.indigo,
      ),

      body: StreamBuilder(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => Users(
                                docToEdit: snapshot.data.docs[index],
                              )));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      color: Colors.grey[200],
                      child: Column(
                        children: [
                          Text(snapshot.data.docs[index]['Username']),
                          Text(snapshot.data.docs[index]['Email']),
                          Text(snapshot.data.docs[index]['BloodGroup']),
                          Text(snapshot.data.docs[index]['Gender']),

                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}