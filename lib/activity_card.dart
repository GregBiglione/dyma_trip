import 'package:dyma_trip/model/activity_model.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  const ActivityCard({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundImage: AssetImage(activity.image),),//Image.asset(activity.image, width: 50,),
        title: Text(activity.name),
        subtitle: Text(activity.city),
        trailing: Checkbox(value: false, tristate: false, onChanged: (value) {}),
      ),
    );
  }
}
