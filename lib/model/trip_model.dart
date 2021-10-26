import 'package:dyma_trip/model/activity_model.dart';

class Trip {
  late String city;
  late List<Activity> activities;
  late DateTime? date;

  Trip({required this.city, required this.activities, required this.date});
}