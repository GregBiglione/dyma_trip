import 'package:flutter/material.dart';

class TripOverviewCity extends StatelessWidget {
  final String cityName;
  final String cityImage;

  const TripOverviewCity({Key? key, required this.cityName, required this.cityImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Image.network(
            cityImage,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black54,
          ),
          Center(
            child: Text(
              cityName,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}