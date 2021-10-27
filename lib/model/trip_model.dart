import 'package:dyma_trip/model/activity_model.dart';
import 'package:flutter/cupertino.dart';

class Trip {
  late String id;
  late String city;
  late List<Activity> activities;
  late DateTime? date;

  Trip({required this.city, required this.activities, required this.date}) : id = UniqueKey().toString();
}