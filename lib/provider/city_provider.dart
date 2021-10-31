import 'dart:collection';

import 'package:dyma_trip/model/city_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CityProvider with ChangeNotifier {
  List<City> _cities = [];

  UnmodifiableListView<City> get cities => UnmodifiableListView(_cities);

  Future<void> fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse("http://10.0.2.2:80/api/cities"));
      if(response.statusCode == 200){
        _cities = (json.decode(response.body) as List).map((cityJson) => City.fromJson(cityJson)).toList();
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  //----------------------------------------------------------------------------
  //----------------------- Get cities by name ---------------------------------
  //----------------------------------------------------------------------------

  City getCitiesByName(String cityName) => cities.firstWhere((city) => city.name == cityName);
}