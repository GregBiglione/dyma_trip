enum ActivityStatus { toDo, done }

class Activity{
  late String id;
  late String name;
  late String image;
  late String city;
  late double price;
  late ActivityStatus status;

  Activity({required this.id, required this.name, required this.image, required this.city, required this.price, this.status = ActivityStatus.toDo});

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
}