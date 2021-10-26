import 'package:dyma_trip/model/activity_model.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final bool isSelected;
  final VoidCallback toggleActivity;

  const ActivityCard({Key? key, required this.activity, required this.isSelected, required this.toggleActivity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        margin: EdgeInsets.all(1),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Ink.image(
              image: AssetImage(activity.image),
              fit: BoxFit.cover,
              child: InkWell(
                onTap: toggleActivity,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if(isSelected) Icon(Icons.check_circle, size: 30, color: Colors.greenAccent,),
                        ],
                      ),
                  ),
                  Row(
                    children: [
                      Flexible(
                          child: FittedBox(
                            child: Text(
                              activity.name,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      );
  }
}
