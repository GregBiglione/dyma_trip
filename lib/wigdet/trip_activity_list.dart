import 'package:dyma_trip/model/activity_model.dart';
import 'package:dyma_trip/wigdet/trip_activity_card.dart';
import 'package:flutter/material.dart';

class TripActivityList extends StatelessWidget {
  final List<Activity> activities;
  final Function deleteTripActivity;

  const TripActivityList({Key? key, required this.activities, required this.deleteTripActivity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemBuilder: (context, index) {
            var activity = activities[index];
            return TripActivityCard(activity: activity, deleteTripActivity: deleteTripActivity);
          },
        itemCount: activities.length,
      ),
    );
  }
}
