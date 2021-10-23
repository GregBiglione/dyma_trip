import 'package:flutter/cupertino.dart';
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
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 5,
                child: Container(
                  height: 150,
                  color: Colors.blue,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset("assets/images/los_angeles.jpg", fit: BoxFit.cover,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

