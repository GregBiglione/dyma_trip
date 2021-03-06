import 'package:dyma_trip/wigdet/activity_form.dart';
import 'package:dyma_trip/wigdet/drawer.dart';
import 'package:flutter/material.dart';

class ActivityFormView extends StatelessWidget {
  static const String ROUTE_NAME = "/activity-form";

  const ActivityFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String cityName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text("Ajouter une activité"),
      ),
      drawer: DrawerTrip(),
      body: SingleChildScrollView(
        child: ActivityForm(
            cityName: cityName
        ),
      )
    );
  }
}
