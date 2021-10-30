import 'package:dyma_trip/model/city_model.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final City city;

  const CityCard({Key? key, required this.city,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 150,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Ink.image(
                fit: BoxFit.cover,
                image: AssetImage(city.image),
                child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/city",
                    arguments: city.name,
                  );
                },
              ),
            ),
            Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  color: Colors.black54,
                  child: Text(
                    city.name,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
