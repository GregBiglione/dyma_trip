import 'package:dyma_trip/provider/city_provider.dart';
import 'package:dyma_trip/provider/trip_provider.dart';
import 'package:dyma_trip/view/city_view.dart';
import 'package:dyma_trip/view/home_view.dart';
import 'package:dyma_trip/view/trip_view.dart';
import 'package:dyma_trip/view/trips_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  late List<Trip> trips = [
    Trip(
        activities: [],
        city: "Los Angeles",
        date: DateTime.now().add(Duration(days: 2))),
    Trip(
        activities: [],
        city: "Los Angeles",
        date: DateTime.now().add(Duration(days: 3))),
    Trip(
        activities: [],
        city: "Los Angeles",
        date: DateTime.now().subtract(Duration(days: 1))),
  ];

  //----------------------------------------------------------------------------
  //----------------------- Save Trip Dialog box -------------------------------
  //----------------------------------------------------------------------------

  void addTrip(Trip trip) {
    trips.add(trip);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CityProvider()),
        ChangeNotifierProvider.value(value: TripProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (_) => HomeView(),
          CityView.ROUTE_NAME: (_) => CityView(),
          TripsView.ROUTE_NAME: (_) => TripsView(),
          TripView.ROUTE_NAME: (_) => TripView(),
        },
        //home: HomeView(),
      ),
    );
    /*MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(cities: widget.cities,),
      */ /*onGenerateRoute: (settings) {
        switch(settings.name) {
          case CityView.ROUTE_NAME:
            return MaterialPageRoute(
                builder: (context) {
                  final City city = settings.arguments as City;
                  return CityView(
                      city: city,
                      addTrip: addTrip,
                  );
                }
            );
          case TripsView.ROUTE_NAME:
            return MaterialPageRoute(
                builder: (context) {
                  return TripsView(trips: trips);
                }
            );
          case TripView.ROUTE_NAME:
            return MaterialPageRoute(
                builder: (context) {
                  String? tripId = (settings.arguments as Map<String, String>)["tripId"];
                  String? cityName = (settings.arguments as Map<String, String>)["cityName"];
                  return TripView(
                    trip: trips.firstWhere((trip) => trip.id == tripId),
                    city: widget.cities.firstWhere((city) => city.name == cityName),
                  );
                },
            );
        }
      },*/ /*
    );*/
  }
}
