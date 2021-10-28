import 'package:dyma_trip/model/activity_model.dart';
import 'package:flutter/material.dart';

class ToDoActivities extends StatelessWidget {
  final List<Activity> activities;

  const ToDoActivities({Key? key, required this.activities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, i) => Text(activities[i].name),
    );
  }
}
