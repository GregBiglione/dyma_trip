import 'package:dyma_trip/wigdet/activity_card.dart';
import 'package:dyma_trip/model/activity_model.dart';
import 'package:dyma_trip/wigdet/activity_list.dart';
import 'package:dyma_trip/wigdet/trip_overview.dart';
import 'package:flutter/material.dart';
import 'package:dyma_trip/data/data_activity.dart' as data;

import 'model/trip_model.dart';

class City extends StatefulWidget {
  final List<Activity> activities = data.activities;

  City({Key? key}) : super(key: key);

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  List<Activity> activities = [];
  Trip trip = Trip(city: "Los Angeles", activities: [], date: DateTime.now());

  //----------------------------------------------------------------------------
  //----------------------- Show Date picker -----------------------------------
  //----------------------------------------------------------------------------

  void setDate(){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2486)
    ).then((selectedDate) {
      if(selectedDate != null) {
        setState(() {
          trip.date = selectedDate;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.chevron_left
        ),
        title: Text("Organisation du voyage"),
        actions: [
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            TripOverview(trip: trip, setDate: setDate),
            Expanded(
                child: ActivityList(activities: widget.activities),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.map), label: "Découverte"),
            BottomNavigationBarItem(icon: Icon(Icons.stars), label: "Mes activités"),
          ],
      ),
    );
  }
}
