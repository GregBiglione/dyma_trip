import 'dart:collection';

import 'package:dyma_trip/model/activity_model.dart';
import 'package:dyma_trip/model/trip_model.dart';
import 'package:flutter/material.dart';
import 'package:dyma_trip/data/data_activity.dart' as data;

class TripProvider with ChangeNotifier {
  final List<Trip> _trips = data.trips;

  UnmodifiableListView<Trip> get trips => UnmodifiableListView(_trips);

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
  //----------------------- Get cities by name ---------------------------------
  //----------------------------------------------------------------------------

  void setActivityToDone(Activity activity) {
    activity.status = ActivityStatus.done;
    notifyListeners();
  }
}