import 'package:dyma_trip/model/city_model.dart';
import 'package:dyma_trip/model/trip_model.dart';
import 'package:dyma_trip/provider/city_provider.dart';
import 'package:dyma_trip/provider/city_provider.dart';
import 'package:dyma_trip/provider/trip_provider.dart';
import 'package:dyma_trip/wigdet/trip_activities.dart';
import 'package:dyma_trip/wigdet/trip_city_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TripView extends StatelessWidget {
  static const String ROUTE_NAME = "/trip";

  TripView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? tripId = (ModalRoute.of(context)!.settings.arguments as Map<String?, String?>)["tripId"];
    final String? cityName = (ModalRoute.of(context)!.settings.arguments as Map<String?, String?>)["cityName"];
    final Trip trip = Provider.of<TripProvider>(context).getTripById(tripId!);
    final City city = Provider.of<CityProvider>(context).getCitiesByName(cityName!);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              TripCityAppBar(city: city),
              TripActivities(activities: trip.activities),
            ],
          ),
        ),
      ),
    );
  }
}
