import 'package:dyma_trip/model/city_model.dart';
import 'package:dyma_trip/model/trip_model.dart';
import 'package:flutter/material.dart';

class TripView extends StatefulWidget {
  static const String ROUTE_NAME = "/trip";
  final Trip trip;
  final City city;

  const TripView({Key? key, required this.trip, required this.city}) : super(key: key);

  @override
  _TripViewState createState() => _TripViewState();
}

class _TripViewState extends State<TripView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Text("TripView"),
    );
  }
}
