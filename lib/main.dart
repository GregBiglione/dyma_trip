import 'package:dyma_trip/view/city_view.dart';
import 'package:dyma_trip/view/home_view.dart';
import 'package:dyma_trip/wigdet/trips_view.dart';
import 'package:flutter/material.dart';

import 'model/city_model.dart';

void main() {
  runApp(DymaTrip());
}

class DymaTrip extends StatelessWidget {
  const DymaTrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
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
