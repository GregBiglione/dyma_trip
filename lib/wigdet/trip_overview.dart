import 'package:dyma_trip/model/trip_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TripOverview extends StatelessWidget {
  final Trip trip;
  final VoidCallback setDate;

  const TripOverview({Key? key, required this.trip, required this.setDate}) : super(key: key);

  //----------------------------------------------------------------------------
  //----------------------- Get trip price -------------------------------------
  //----------------------------------------------------------------------------

  double get amount {
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Los Angeles",
            style: TextStyle(fontSize: 25, decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(height: 30,),
          Row(
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
          SizedBox(height: 30,),
          Row(
            children: [
              Expanded(
                child: Text("Montant/personne:", style: TextStyle(fontSize: 20),),
              ),
              Text("$amount€", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ],
          ),
        ],
      ),
    );
  }
}
