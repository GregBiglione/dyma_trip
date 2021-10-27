import 'package:dyma_trip/model/activity_model.dart';
import 'package:dyma_trip/wigdet/activity_card.dart';
import 'package:flutter/material.dart';

class ActivityList extends StatelessWidget {
  final List<Activity> activities;
  final List<Activity> selectedActivities;
  final Function toggleActivity;

  const ActivityList({Key? key, required this.activities, required this.selectedActivities, required this.toggleActivity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        crossAxisCount: 2,
        children:
          activities.map((activity) => ActivityCard(
            activity: activity,
            isSelected: selectedActivities.contains(activity),
            toggleActivity: () {
              toggleActivity(activity);
            },
          ),
          ).toList(),
    );
  }
}
