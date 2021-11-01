import 'package:dyma_trip/model/activity_model.dart';

class Trip {
  String? id;
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

  //----------------------------------------------------------------------------
  //----------------------- Transform trip to JSON -----------------------------
  //----------------------------------------------------------------------------

  Map<String, dynamic> toJson() {
    if (id != null) {
      return {
            "_id": id,
            "city": city,
            "date": date!.toIso8601String(),
            "activities": activities
                .map((activity) => activity.toJson())
                .toList(),
          };
    } else {
      return {
        "city": city,
        "date": date!.toIso8601String(),
        "activities": activities
            .map((activity) => activity.toJson())
            .toList(),
      };
    }
  }
}