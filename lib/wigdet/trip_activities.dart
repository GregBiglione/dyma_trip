import 'package:dyma_trip/model/activity_model.dart';
import 'package:flutter/material.dart';

class TripActivities extends StatelessWidget {
  final List<Activity> activities;

  const TripActivities({Key? key, required this.activities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              child: TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Tab(text: "À faire",),
                  Tab(text: "Fait",),
                ],
              ),
            ),
            Container(
              height: 600,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
