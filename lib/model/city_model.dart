import 'package:dyma_trip/model/activity_model.dart';

class City {
  String id;
  String name;
  String image;
  List<Activity> activities;

  City({required this.id, required this.name, required this.image, required this.activities});

  //----------------------------------------------------------------------------
  //----------------------- Create City from JSON ------------------------------
  //----------------------------------------------------------------------------

  City.fromJson(Map<String, dynamic> json):
        id = json["_id"],
        name = json["name"],
        image = json["image"],
        activities = (json["activities"] as List).map((activityJson) => Activity.fromJson(activityJson)).toList();

}