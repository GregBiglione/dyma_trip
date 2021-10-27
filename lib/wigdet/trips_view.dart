import 'package:dyma_trip/model/trip_model.dart';
import 'package:dyma_trip/wigdet/drawer.dart';
import 'package:dyma_trip/wigdet/trip_list.dart';
import 'package:flutter/material.dart';

class TripsView extends StatefulWidget {
  static const String ROUTE_NAME = "/trips";
  final List<Trip> trips;

  const TripsView({Key? key, required this.trips}) : super(key: key);

  @override
  _TripsViewState createState() => _TripsViewState();
}

class _TripsViewState extends State<TripsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes voyages"),
      ),
      drawer: DrawerTrip(),
      body: TripList(trips: widget.trips),
    );
  }
}
