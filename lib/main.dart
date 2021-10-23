import 'package:flutter/material.dart';

void main() {
  runApp(DymaTrip());
}

class DymaTrip extends StatelessWidget {
  const DymaTrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: Text("DymaTrip"),
          actions: [
            Icon(Icons.more_vert),
          ],
        ),
        body: Text("Dymatrip"),
      ),
    );
  }
}

