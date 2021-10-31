import 'package:dyma_trip/model/city_model.dart';
import 'package:dyma_trip/provider/city_provider.dart';
import 'package:dyma_trip/wigdet/city_card.dart';
import 'package:dyma_trip/wigdet/drawer.dart';
import 'package:dyma_trip/wigdet/dyma_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeView extends StatefulWidget {
  static String ROUTE_NAME = "/";
  //final List<City> cities;

  //const HomeView({Key? key, required this.cities}) : super(key: key);

  @override
  _HomeViewState createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    List<City> cities = Provider.of<CityProvider>(context).cities;

    return Scaffold(
      appBar: AppBar(
        title: Text("DymaTrip"),
      ),
      drawer: DrawerTrip(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: cities.isNotEmpty ? Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...cities.map(
              (city) => CityCard(
                city: city,
              ),
            ).toList(),
          ],
        ) : DymaLoader(),
      ),
    );
  }
}
