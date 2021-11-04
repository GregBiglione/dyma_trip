import 'package:dyma_trip/model/location_activity_model.dart';

enum ActivityStatus { toDo, done }

class Activity{
  late String? id;
  late String? name;
  late String? image;
  late String city;
  late double price;
  late ActivityStatus status;
  late LocationActivity location;

  Activity({this.id, required this.name, required this.image, required this.city, required this.price, required this.location,
    this.status = ActivityStatus.toDo});

  //----------------------------------------------------------------------------
  //----------------------- Create Activity from JSON --------------------------
  //----------------------------------------------------------------------------

  Activity.fromJson(Map<String, dynamic> json):
        id = json["_id"],
        name = json["name"],
        image = json["image"],
        city = json["city"],
        price = json["price"].toDouble(),
        status = json["status"] == 0 ? ActivityStatus.toDo : ActivityStatus.done;

  //----------------------------------------------------------------------------
  //----------------------- Transform activity to JSON -------------------------
  //----------------------------------------------------------------------------

  Map<String, dynamic> toJson() {
    Map<String, dynamic> value = {
      "_id": id,
      "name": name,
      "image": image,
      "city": city,
      "price": price,
      "status": status == ActivityStatus.toDo ? 0 : 1,
    };
    if(id != null){
      value["_id"] = id;
    }
    return value;
  }
}