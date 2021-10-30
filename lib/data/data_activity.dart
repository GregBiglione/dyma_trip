import 'package:dyma_trip/model/activity_model.dart';
import 'package:dyma_trip/model/city_model.dart';
import 'package:dyma_trip/model/trip_model.dart';

List<City> cities = [
  City(name: "Los Angeles", image: "assets/images/los_angeles.jpg", activities: losAngelesActivities),
  City(name: "Londres", image: "assets/images/london.jpg", activities: []),
  City(name: "Stockholm", image: "assets/images/stockholm.jpg", activities: []),
];

List<Trip> trips = [
  Trip(activities: [], city: "Los Angeles", date: DateTime.now().add(Duration(days: 2))),
  Trip(activities: [], city: "Los Angeles", date: DateTime.now().add(Duration(days: 3))),
  Trip(activities: [], city: "Los Angeles", date: DateTime.now().subtract(Duration(days: 1))),
];

List<Activity> losAngelesActivities = [
  Activity(id: "la1", name: "Les studios Universal", image: "assets/images/activities/universal_studios.jpg", city: "Los Angeles", price: 35.00),
  Activity(id: "la2", name: "Venice beach", image: "assets/images/activities/venice_beach.jpg", city: "Los Angeles", price: 0.00),
  Activity(id: "la3", name: "Hollywood sign", image: "assets/images/activities/hollywood_sign.jpg", city: "Los Angeles", price: 15.00),
  Activity(id: "la4", name: "Santa Monica", image: "assets/images/activities/santa_monica.jpg", city: "Los Angeles", price: 0.00),
  Activity(id: "la5", name: "Hollywood walk", image: "assets/images/activities/hollywood_walk.jpg", city: "Los Angeles", price: 0.00),
  Activity(id: "la6", name: "Little Tokyo", image: "assets/images/activities/little_tokyo.jpg", city: "Los Angeles", price: 0.00),
  Activity(id: "la7", name: "Venice canals", image: "assets/images/activities/venice_canals.jpg", city: "Los Angeles", price: 25.00),
  Activity(id: "la8", name: "Kelso Dunes", image: "assets/images/activities/kelso_dunes.jpg", city: "Los Angeles", price: 0.00)
];
