import 'dart:collection';

import 'package:dyma_trip/model/activity_model.dart';
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

  City getCityByName(String cityName) =>
      cities.firstWhere((city) => city.name == cityName);

  //----------------------------------------------------------------------------
  //----------------------- Add activity to city -------------------------------
  //----------------------------------------------------------------------------

  Future<void> addActivityToCity(Activity newActivity) async {
    try {
      String cityId = getCityByName(newActivity.city).id;
      http.Response response = await http.post(Uri.parse("$host/api/city/$cityId/activity"),
              body: json.encode(newActivity.toJson(),),
              headers: {"Content-type": "application/json"},
          );
      if(response.statusCode == 200) {
        int index = _cities.indexWhere((city) => city.id == cityId);
        _cities[index] = City.fromJson(json.decode(response.body),
        );
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  //----------------------------------------------------------------------------
  //----------------------- Check already existing activity --------------------
  //----------------------------------------------------------------------------

  Future<dynamic> verifyIfActivityNameIsUnique(String cityName, String activityName) async {
    try {
      City city = getCityByName(cityName);
      http.Response response = await http.get(Uri.parse("$host/api/city/${city.id}/activities/verify/$activityName"));
      if(response.body != null) {
        return json.decode(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

}
