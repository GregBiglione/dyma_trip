import 'dart:collection';

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
      http.Response response = await http.get(Uri.parse("$host/api/trips"));
      if(response.statusCode == 200){
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

  void addTrip(Trip trip) {
    _trips.add(trip);
    notifyListeners();
  }

  //----------------------------------------------------------------------------
  //----------------------- Get trip by id -------------------------------------
  //----------------------------------------------------------------------------

  Trip getTripById(String tripId){
    return trips.firstWhere((trip) => trip.id == tripId);
  }

  //----------------------------------------------------------------------------
  //----------------------- Set activity to done -------------------------------
  //----------------------------------------------------------------------------

  void setActivityToDone(Activity activity) {
    activity.status = ActivityStatus.done;
    notifyListeners();
  }
}