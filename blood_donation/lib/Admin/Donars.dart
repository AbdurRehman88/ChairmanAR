import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'EditBloodRequest.dart';
import 'EditDoners.dart';

class UDonors extends StatelessWidget {

  final ref = FirebaseFirestore.instance.collection('Donate');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users Doners'),
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
                              builder: (_) => editDonors(
                                docToEdit: snapshot.data.docs[index],
                              )));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 150,
                      color: Colors.grey[200],
                      child: Column(
                        children: [
                          Text(snapshot.data.docs[index]['NameController']),
                          Text(snapshot.data.docs[index]['addressController']),
                          Text(snapshot.data.docs[index]['phoneNumberController']),
                          Text(snapshot.data.docs[index]['bloodGroupController']),
                          Text(snapshot.data.docs[index]['genderController']),
                          Text(snapshot.data.docs[index]['dateController']),

                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}