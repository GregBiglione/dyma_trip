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
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 200,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text("Choisissez une date"),
                      ),
                      ElevatedButton(
                          onPressed: () {

                          },
                          child: Text("Sélectionnez une date"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children:
                  widget.activities.map((activity) => ActivityCard(activity: activity,),
                  ).toList(),
                ),
            ),
          ],
        )
        /*GridView.count(
            crossAxisCount: 2,
            children:
              widget.activities.map((activity) => ActivityCard(activity: activity,),
              ).toList(),
        ),*/
      ),
    );
  }
}
