import 'package:dyma_trip/activity_card.dart';
import 'package:dyma_trip/model/activity_model.dart';
import 'package:flutter/material.dart';
import 'package:dyma_trip/data/data_activity.dart' as data;

class City extends StatefulWidget {
  final List<Activity> activities = data.activities;

  City({Key? key}) : super(key: key);

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  List<Activity> activities = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.chevron_left
        ),
        title: Text("Los Angeles"),
        actions: [
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemBuilder: (context, index) {
              return ActivityCard(activity: widget.activities[index]);
            },
            itemCount: widget.activities.length,
        ),/*Column(
            children: widget.activities.map((activity) =>
            ActivityCard(activity: activity),
            ).toList(),
        ),*/
      ),
    );
  }
}
