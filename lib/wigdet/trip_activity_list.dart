import 'package:dyma_trip/model/activity_model.dart';
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
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(activity.image),
                ),
                title: Text(activity.name),
                subtitle: Text(activity.city),
                trailing: IconButton(
                  icon: Icon(Icons.delete), color: Colors.red,
                  onPressed: () {
                    deleteTripActivity(activity.id);
                  },
                ),
              ),
            );
          },
        itemCount: activities.length,
      ),
    );
  }
}
