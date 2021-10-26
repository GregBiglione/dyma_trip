import 'package:dyma_trip/wigdet/city_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List cities = [
    {"name": "Los Angeles", "image": "assets/images/los_angeles.jpg"},
    {"name": "London", "image": "assets/images/london.jpg"},
    {"name": "Stockholm", "image": "assets/images/stockholm.jpg"}
  ];

  //----------------------------------------------------------------------------
  //------------------ Switch check---------------------------------------------
  //----------------------------------------------------------------------------

  void switchChecked(city) {
    int index = cities.indexOf(city);
    setState(() {
      cities[index]["checked"] = !cities[index]["checked"];
    });
  }

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
                name: city["name"],
                image: city["image"],
                checked: city["checked"],
                updateChecked: () {
                  switchChecked(city);
                },
              ),
            ).toList(),
          ],
        ),
      ),
    );
  }
}
