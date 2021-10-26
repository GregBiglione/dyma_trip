import 'package:dyma_trip/model/activity_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final bool isSelected;
  final VoidCallback toggleActivity;

  const ActivityCard({Key? key, required this.activity, required this.isSelected, required this.toggleActivity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        //width: double.infinity,
        height: 150,
        margin: EdgeInsets.all(1),
        child: Ink.image(
          image: AssetImage(activity.image),
          fit: BoxFit.cover,
          child: InkWell(
            onTap: toggleActivity,
          ),
        ),
      );
  }
}
