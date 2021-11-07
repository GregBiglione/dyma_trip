import 'package:dyma_trip/model/location_activity_model.dart';

enum ActivityStatus { toDo, done }

class Activity{
  late String? id;
  late String? name;
  late String? image;
  late String city;
  late double price;
  late LocationActivity? location;
  late ActivityStatus status;

  Activity({this.id, required this.name, required this.image, required this.city, required this.price, this.location,
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
        location = LocationActivity(
          address: json["address"],
          latitude: json["latitude"],
          longitude: json["longitude"],
        ),
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
      "address": location!.address,
      "latitude": location!.latitude!,
      "longitude": location!.longitude!,
      "status": status == ActivityStatus.toDo ? 0 : 1,
    };
    if(id != null){
      value["_id"] = id;
    }
    return value;
  }
}