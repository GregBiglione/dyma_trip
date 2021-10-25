import 'package:dyma_trip/model/activity_model.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  const ActivityCard({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 150,
        margin: EdgeInsets.all(1),
        child: Image.asset(activity.image, fit: BoxFit.cover,),
      );
  }
}
