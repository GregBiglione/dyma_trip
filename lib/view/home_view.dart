import 'package:dyma_trip/model/city_model.dart';
import 'package:dyma_trip/wigdet/city_card.dart';
import 'package:flutter/material.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {
  List cities = [
    City(name: "Los Angeles", image: "assets/images/los_angeles.jpg"),
    City(name: "London", image: "assets/images/london.jpg"),
    City(name: "Stockholm", image: "assets/images/stockholm.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ...cities.map(
              (city) => CityCard(
                city: city,
              ),
            ).toList(),
          ],
        ),
      ),
    );
  }
}
