import 'package:dyma_trip/view/home_view.dart';
import 'package:dyma_trip/view/trips_view.dart';
import 'package:flutter/material.dart';

class DrawerTrip extends StatelessWidget {
  const DrawerTrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Text(
                "DymaTrip",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withOpacity(0.5),
                  /*Colors.blue,
                  Colors.white,*/
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Accueil"),
            onTap: () {
              Navigator.pushNamed(context, HomeView.ROUTE_NAME);
            },
          ),
          ListTile(
            leading: Icon(Icons.flight),
            title: Text("Mes voyages"),
            onTap: () {
              Navigator.pushNamed(context, TripsView.ROUTE_NAME);
            },
          ),
        ],
      ),
    );
  }
}
