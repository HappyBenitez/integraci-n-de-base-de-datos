
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class MyApp extends StatelessWidget {
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Firebase Example'),
        ),
        body: Center(
          child: FutureBuilder(
            future: databaseReference.child('message').once(),
            builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.value.toString());
              } else if (snapshot.hasError) {
                return Text('Error');
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
