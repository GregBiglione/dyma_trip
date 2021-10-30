import 'dart:collection';

import 'package:dyma_trip/model/city_model.dart';
import 'package:flutter/material.dart';
import 'package:dyma_trip/data/data_activity.dart' as data;

class CityProvider with ChangeNotifier {
  final List<City> _cities = data.cities;

  UnmodifiableListView<City> get cities => UnmodifiableListView(_cities);
}