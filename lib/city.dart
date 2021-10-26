import 'package:dyma_trip/model/activity_model.dart';
import 'package:dyma_trip/wigdet/activity_list.dart';
import 'package:dyma_trip/wigdet/trip_activity_list.dart';
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
  late Trip trip;
  late int index;

  //----------------------------------------------------------------------------
  //----------------------- Initialize variables in initState ------------------
  //----------------------------------------------------------------------------

  @override
  void initState() {
    trip = Trip(city: "Los Angeles", activities: [], date: null);
    index = 0;
    super.initState();
  }

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

  //----------------------------------------------------------------------------
  //----------------------- Toggle activity on click  --------------------------
  //----------------------------------------------------------------------------

  void toggleActivity(String id){
    setState(() {
      trip.activities.contains(id) ? trip.activities.remove(id) : trip.activities.add(id);
      print(trip.activities);
    });
  }

  //----------------------------------------------------------------------------
  //----------------------- Get selected activities ----------------------------
  //----------------------------------------------------------------------------

  List<Activity> get tripActivities {
    return widget.activities
        .where((activity) => trip.activities.contains(activity.id))
        .toList();
  }

  //----------------------------------------------------------------------------
  //----------------------- Click on Navigation bottom bar ---------------------
  //----------------------------------------------------------------------------

  void switchIndex(selectedIndex){
    setState(() {
      index = selectedIndex;
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
                child: index == 0 ? ActivityList(
                    activities: widget.activities,
                    selectedActivities: trip.activities,
                    toggleActivity: toggleActivity,
                ) : TripActivityList(
                  activities: tripActivities,
                ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.map), label: "Découverte"),
            BottomNavigationBarItem(icon: Icon(Icons.stars), label: "Mes activités"),
          ],
        onTap: switchIndex,
      ),
    );
  }
}
