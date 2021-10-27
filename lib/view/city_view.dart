import 'package:dyma_trip/model/activity_model.dart';
import 'package:dyma_trip/wigdet/activity_list.dart';
import 'package:dyma_trip/wigdet/trip_activity_list.dart';
import 'package:dyma_trip/wigdet/trip_overview.dart';
import 'package:flutter/material.dart';
import 'package:dyma_trip/data/data_activity.dart' as data;

import '../model/trip_model.dart';

class CityView extends StatefulWidget {
  final List<Activity> activities = data.activities;

  //----------------------------------------------------------------------------
  //----------------------- Responsive design ----------------------------------
  //----------------------------------------------------------------------------

  showContext({required BuildContext context, required List<Widget> children}){
    var orientation = MediaQuery.of(context).orientation;

    if(orientation == Orientation.landscape){
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );
    }
    else {
      return Column(children: children,);
    }
  }

  CityView({Key? key}) : super(key: key);

  @override
  _CityViewState createState() => _CityViewState();
}

class _CityViewState extends State<CityView> {
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
  //----------------------- Delete activity ------------------------------------
  //----------------------------------------------------------------------------

  void deleteTripActivity(String id) {
    setState(() {
      trip.activities.remove(id);
    });
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
        child: widget.showContext(
            context: context,
            children: [
              TripOverview(trip: trip, setDate: setDate),
              Expanded(
                child: index == 0 ? ActivityList(
                  activities: widget.activities,
                  selectedActivities: trip.activities,
                  toggleActivity: toggleActivity,
                ) : TripActivityList(
                  activities: tripActivities,
                  deleteTripActivity: deleteTripActivity,
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
