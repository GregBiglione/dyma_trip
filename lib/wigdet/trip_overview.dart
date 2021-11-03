import 'package:dyma_trip/model/trip_model.dart';
import 'package:dyma_trip/wigdet/trip_overview_city.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TripOverview extends StatelessWidget {
  final Trip trip;
  final VoidCallback setDate;
  final String cityName;
  final String cityImage;
  final double amount;

  const TripOverview({Key? key, required this.trip, required this.setDate, required this.cityName, required this.cityImage,
    required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;

    return Container(
      width: orientation == Orientation.landscape ? size.width * 0.5 : double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TripOverviewCity(cityName: cityName, cityImage: cityImage),
          SizedBox(height: 30,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    trip.date != null
                        ? DateFormat("d/M/y").format(trip.date!)
                        : "Sélectionner une date",
                    style: TextStyle(fontSize: 15),),
                ),
                ElevatedButton(
                  onPressed: setDate,
                  child: Text("Sélectionnez une date",),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: Text("Montant/personne:", style: TextStyle(fontSize: 20),),
                ),
                Text("$amount€", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
}
