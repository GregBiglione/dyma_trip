import 'package:dyma_trip/model/trip_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TripList extends StatelessWidget {
  final List<Trip> trips;

  const TripList({Key? key, required this.trips}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, i) {
          var trip = trips[i];
          return ListTile(
            title: Text(trip.city),
            subtitle: trip.date != null ? Text(DateFormat("d/M/y").format(trip.date!)) : Text("N/A"),
            trailing: Icon(Icons.info),
          );
        },
    );
  }
}
