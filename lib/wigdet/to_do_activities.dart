import 'package:dyma_trip/model/activity_model.dart';
import 'package:flutter/material.dart';

class ToDoActivities extends StatelessWidget {
  final List<Activity> activities;
  final ActivityStatus filter;

  const ToDoActivities({Key? key, required this.activities, required this.filter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: activities.length,
      itemBuilder: (context, i) {
        Activity activity = activities[i];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: filter == ActivityStatus.toDo ? Dismissible(
            direction: DismissDirection.endToStart,
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.centerRight,
              child: Icon(Icons.check_circle, color: Colors.white, size: 30,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green[700],
              ),
            ),
            key: ValueKey(activity.id),
            child: Card(
              child: ListTile(
                title: Text(activity.name),
              ),
            ),
            onDismissed: (_) {
              print("Activity dismissed");
            },
          ) : Card(
            child: ListTile(
              title: Text(activity.name, style: TextStyle(color: Colors.grey),
              ),
              trailing: Icon(Icons.check_circle, color: Colors.green[700], size: 30,
              ),
            ),
          ),
        );
      },
    );
  }
}
