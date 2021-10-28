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
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Mes voyages"),
            bottom: TabBar(
                tabs: [
                  Tab(text: "Prochains voyages", icon: Icon(Icons.flight_takeoff_outlined),),
                  Tab(text: "Villes visitées", icon: Icon(Icons.flight_land_outlined),)
                ],
            ),
          ),
          drawer: DrawerTrip(),
          body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                TripList(
                    trips: widget.trips.where((trip) => DateTime.now().isBefore(trip.date!)).toList()
                ),
                TripList(
                    trips: widget.trips.where((trip) => DateTime.now().isAfter(trip.date!)).toList()
                ),
              ],
          ),
        ),
    );
  }
}
