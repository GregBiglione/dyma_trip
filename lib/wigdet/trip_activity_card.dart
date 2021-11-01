import 'package:dyma_trip/model/activity_model.dart';
import 'package:flutter/material.dart';

class TripActivityCard extends StatefulWidget {
  final Activity activity;
  final Function deleteTripActivity;

  const TripActivityCard({Key? key, required this.activity, required this.deleteTripActivity}) : super(key: key);

  @override
  _TripActivityCardState createState() => _TripActivityCardState();
}

class _TripActivityCardState extends State<TripActivityCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(widget.activity.image!),
        ),
        title: Text(widget.activity.name!),
        subtitle: Text(widget.activity.city),
        trailing: IconButton(
          icon: Icon(Icons.delete), color: Colors.red,
          onPressed: () {
            widget.deleteTripActivity(widget.activity);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Activité supprimée"),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 1),
            ),
            );
          },
        ),
      ),
    );
  }
}
