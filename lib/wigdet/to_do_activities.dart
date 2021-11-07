import 'package:dyma_trip/google_maps/google_maps_view.dart';
import 'package:dyma_trip/model/activity_model.dart';
import 'package:dyma_trip/model/trip_model.dart';
import 'package:dyma_trip/provider/trip_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToDoActivities extends StatelessWidget {
  final String tripId;
  final ActivityStatus filter;

  const ToDoActivities({Key? key, required this.filter, required this.tripId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TripProvider>(
        builder: (context, tripProvider, child) {
          final Trip trip = Provider.of<TripProvider>(context).getTripById(tripId);
          final List<Activity> activities = trip.activities.where((activity) => activity.status == filter).toList();

          return ListView.builder(
            itemCount: activities.length,
            itemBuilder: (context, i) {
              Activity activity = activities[i];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: filter == ActivityStatus.toDo ? Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.check_circle, color: Colors.white, size: 30,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green[700],
                    ),
                  ),
                  key: ValueKey(activity.id),
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, GoogleMapsView.ROUTE_NAME, arguments: {
                      "activityId": activity.id,
                      "tripId": trip.id,
                    }),
                    child: Card(
                      child: ListTile(
                        title: Text(activity.name),
                      ),
                    ),
                  ),
                  confirmDismiss: (_) {
                    return Provider.of<TripProvider>(context, listen: false).updateTrip(trip, activity.id!)
                        .then((_) => true)
                        .catchError((_) => false);
                  },
                ) : Card(
                  child: ListTile(
                    title: Text(activity.name, style: TextStyle(color: Colors.grey),
                    ),
                    trailing: Icon(Icons.check_circle, color: Colors.green[700], size: 30,
                    ),
                  ),
                ),
              );
            },
          );
        },
    );
  }
}
