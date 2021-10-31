import 'package:dyma_trip/model/activity_model.dart';
import 'package:flutter/cupertino.dart';

class Trip {
  late String? id;
  late String? city;
  late List<Activity> activities;
  late DateTime? date;

  Trip({required this.city, required this.activities, required this.date});

  //----------------------------------------------------------------------------
  //----------------------- Create Trip from JSON ------------------------------
  //----------------------------------------------------------------------------

  Trip.fromJson(Map<String, dynamic> json):
        id = json["_id"],
        city = json["city"],
        date = DateTime.parse(json["date"]),
        activities = (json["activities"] as List)
            .map((activityJson) => Activity.fromJson(activityJson))
            .toList();

}