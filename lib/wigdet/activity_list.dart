import 'package:dyma_trip/model/activity_model.dart';
import 'package:dyma_trip/wigdet/activity_card.dart';
import 'package:flutter/material.dart';

class ActivityList extends StatelessWidget {
  final List<Activity> activities;

  const ActivityList({Key? key, required this.activities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        crossAxisCount: 2,
        children:
          activities.map((activity) => ActivityCard(activity: activity,)).toList(),
    );
  }
}
