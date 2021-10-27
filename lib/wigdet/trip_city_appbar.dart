import 'package:dyma_trip/model/city_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TripCityAppBar extends StatelessWidget {
  final City city;

  const TripCityAppBar({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Image.asset(
            city.image,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black54,
            padding: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 5,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Expanded(
                    child: Center(
                      child: Text(
                        city.name,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                        ),
                      ),
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
