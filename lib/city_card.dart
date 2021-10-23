import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final String name;
  final String image;
  final bool checked;

  const CityCard({Key? key, required this.name, required this.image, required this.checked}) : super(key: key);

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
                image: AssetImage(image),
              child: InkWell(
                onTap: (){
                  print("Image clicked");
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star_border,
                          color: Colors.amberAccent,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            color: Colors.white, fontSize: 30),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
