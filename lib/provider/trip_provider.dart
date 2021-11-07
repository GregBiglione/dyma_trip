import 'dart:collection';
import 'dart:io';

import 'package:dyma_trip/model/activity_model.dart';
import 'package:dyma_trip/model/trip_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TripProvider with ChangeNotifier {
  String host = "http://10.0.2.2:80";
  List<Trip> _trips = [];
  bool isLoading = false;

  UnmodifiableListView<Trip> get trips => UnmodifiableListView(_trips);

  Future<void> fetchData() async {
    try {
      isLoading = true;
      http.Response response = await http
          .get(Uri.parse("$host/api/trips")); //check if trip instead of trips
      if (response.statusCode == 200) {
        _trips = (json.decode(response.body) as List)
            .map((tripJson) => Trip.fromJson(tripJson))
            .toList();
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }

  //----------------------------------------------------------------------------
  //----------------------- Add trip -------------------------------------------
  //----------------------------------------------------------------------------

  Future<void> addTrip(Trip trip) async {
    try {
      http.Response response = await http.post(Uri.parse("$host/api/trip"),
          body: json.encode(trip.toJson()),
          headers: {"Content-type": "application/json"},
      );
      if (response.statusCode == 200) {
        _trips.add(
          Trip.fromJson(
            json.decode(response.body),
          ),
        );
        throw HttpException("Error");
      }
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  //----------------------------------------------------------------------------
  //----------------------- Get trip by id -------------------------------------
  //----------------------------------------------------------------------------

  Trip getTripById(String tripId) {
    return trips.firstWhere((trip) => trip.id == tripId);
  }

  //----------------------------------------------------------------------------
  //----------------------- Get activities by id -------------------------------
  //----------------------------------------------------------------------------

  Activity getActivitiesById({required String activityId, required String tripId}){
    return getTripById(tripId).activities.firstWhere((activity) => activity.id == activityId);
  }

  //----------------------------------------------------------------------------
  //----------------------- Set activity to done -------------------------------
  //----------------------------------------------------------------------------

  Future<void> updateTrip(Trip trip, String activityId) async {
    try {
      Activity activity = trip.activities
              .firstWhere((activity) => activity.id == activityId);
              activity.status = ActivityStatus.done;
      http.Response response = await http.put(Uri.parse("$host/api/trip"),
            body: json.encode(trip.toJson()),
            headers: {"Content-type": "application/json"},
          );
      if(response.statusCode != 200){
        activity.status = ActivityStatus.toDo;
      }
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
