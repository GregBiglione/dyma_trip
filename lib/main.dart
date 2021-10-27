import 'package:dyma_trip/view/city_view.dart';
import 'package:dyma_trip/view/home_view.dart';
import 'package:dyma_trip/wigdet/trips_view.dart';
import 'package:flutter/material.dart';
import 'data/data_activity.dart';
import 'model/city_model.dart';
import 'package:dyma_trip/data/data_activity.dart' as data;

import 'model/trip_model.dart';

void main() {
  runApp(DymaTrip());
}

class DymaTrip extends StatefulWidget {
  final List<City> cities = data.cities;

  DymaTrip({Key? key}) : super(key: key);

  @override
  _DymaTripState createState() => _DymaTripState();
}

class _DymaTripState extends State<DymaTrip> {
  /*late List<Trip> trips = [];*/

  /*//----------------------------------------------------------------------------*/
  /*//----------------------- Save Trip Dialog box -------------------------------*/
  /*//----------------------------------------------------------------------------*/

  /*void addTrip(Trip trip) {*/
  /*  trips.add(trip);*/
  /*}*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(cities: cities,),
      onGenerateRoute: (settings) {
        switch(settings.name) {
          case CityView.ROUTE_NAME:
            return MaterialPageRoute(
                builder: (context) {
                  final City city = settings.arguments as City;
                  return CityView(city: city);
                }
            );
          case TripsView.ROUTE_NAME:
            return MaterialPageRoute(
                builder: (context) {
                  return TripsView();
                }
            );
        }
      },
    );
  }
}
