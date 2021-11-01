import 'package:dyma_trip/wigdet/dyma_loader.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TripWeather extends StatelessWidget {
  final String cityName;
  final String hostBase ="https://api.openweathermap.org/data/2.5/weather?q=";
  final String hostAppid = "&appid=";
  final String apiKey = "apiKey";

  const TripWeather({Key? key, required this.cityName}) : super(key: key);

  String get query => "$hostBase$cityName$hostAppid$apiKey";

  //----------------------------------------------------------------------------
  //----------------------- Get weather ----------------------------------------
  //----------------------------------------------------------------------------

  Future<String> get getWeather {
    return http.get(Uri.parse(query)).then((http.Response response) {
      Map<String, dynamic> body = json.decode(response.body);
      return body["weather"][0]["icon"] as String;
    }).catchError((e) => "Error");
  }

  //----------------------------------------------------------------------------
  //----------------------- Get weather icon -----------------------------------
  //----------------------------------------------------------------------------

  String getIconUrl(String iconName){
    return "https://openweathermap.org/img/wn/$iconName@2x.png";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getWeather,
      builder: (_, snapshot) {
        if(snapshot.hasError){
          return Text("Error");
        }
        else if(snapshot.hasData) {
          return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Météo", style: TextStyle(fontSize: 20),
                ),
                Image.network(
                  getIconUrl(snapshot.data as String),
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          );
        }
        else {
          return DymaLoader();
        }
      },
    );
  }
}
