import 'package:dyma_trip/model/trip_model.dart';
import 'package:dyma_trip/provider/trip_provider.dart';
import 'package:dyma_trip/wigdet/drawer.dart';
import 'package:dyma_trip/wigdet/dyma_loader.dart';
import 'package:dyma_trip/wigdet/trip_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TripsView extends StatelessWidget {
  static const String ROUTE_NAME = "/trips";

  TripsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TripProvider tripProvider = Provider.of<TripProvider>(context);

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
          body: tripProvider.isLoading != true ? tripProvider.trips.isNotEmpty ? TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                TripList(
                    trips: tripProvider.trips.where((trip) => DateTime.now().isBefore(trip.date!)).toList()
                ),
                TripList(
                    trips: tripProvider.trips.where((trip) => DateTime.now().isAfter(trip.date!)).toList()
                ),
              ],
          ): Container(
            alignment: Alignment.center,
            child: Text("Aucun voyage pour le moment"),
          ): DymaLoader(),
        ),
    );
  }
}
