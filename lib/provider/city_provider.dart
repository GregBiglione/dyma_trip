import 'dart:collection';

import 'package:dyma_trip/model/city_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CityProvider with ChangeNotifier {
  String host = "http://10.0.2.2:80";
  List<City> _cities = [];
  bool isLoading = false;

  UnmodifiableListView<City> get cities => UnmodifiableListView(_cities);

  UnmodifiableListView<City> filteredCities(String filter) =>
      UnmodifiableListView(
        _cities.where(
          (city) => city.name.toLowerCase().startsWith(
                filter.toLowerCase(),
              ),
        ).toList(),
      );

  Future<void> fetchData() async {
    try {
      isLoading = true;
      http.Response response = await http.get(Uri.parse("$host/api/cities"));
      if (response.statusCode == 200) {
        _cities = (json.decode(response.body) as List)
            .map((cityJson) => City.fromJson(cityJson))
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
  //----------------------- Get cities by name ---------------------------------
  //----------------------------------------------------------------------------

  City getCitiesByName(String cityName) =>
      cities.firstWhere((city) => city.name == cityName);
}
