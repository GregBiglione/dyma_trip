enum ActivityStatus { toDo, done }

class Activity{
  late String id;
  late String name;
  late String image;
  late String city;
  late double price;
  late ActivityStatus status;

  Activity({required this.id, required this.name, required this.image, required this.city, required this.price,}) :
   status = ActivityStatus.toDo;
}