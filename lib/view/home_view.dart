import 'package:dyma_trip/model/city_model.dart';
import 'package:dyma_trip/wigdet/city_card.dart';
import 'package:dyma_trip/wigdet/drawer.dart';
import 'package:flutter/material.dart';


class HomeView extends StatefulWidget {
  static String ROUTE_NAME = "/";
  final List<City> cities;

  const HomeView({Key? key, required this.cities}) : super(key: key);

  @override
  _HomeViewState createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DymaTrip"),
      ),
      drawer: DrawerTrip(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...widget.cities.map(
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
