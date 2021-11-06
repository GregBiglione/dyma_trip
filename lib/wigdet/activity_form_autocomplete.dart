import 'dart:async';

import 'package:dyma_trip/model/location_activity_model.dart';
import 'package:flutter/material.dart';

Future<LocationActivity?> showInputAutoComplete(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) => InputAddress(),
  );
}

class InputAddress extends StatefulWidget {
  const InputAddress({Key? key}) : super(key: key);

  @override
  _InputAddressState createState() => _InputAddressState();
}

class _InputAddressState extends State<InputAddress> {
  List<dynamic> _places = [];
  Timer? _debounce;

  //----------------------------------------------------------------------------
  //----------------------- Search address -------------------------------------
  //----------------------------------------------------------------------------

  void _searchAddress(String value) async {
    if(_debounce?.isActive == true) _debounce?.cancel();
    _debounce = Timer(Duration(seconds: 1), (){
      print(value);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Rechercher",
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: _searchAddress,
              ),
              Positioned(
                top: 5,
                right: 3,
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.clear),
                ),
              ),
            ],
          ),
          /*ListView.builder(
            itemCount: _places.length,
            itemBuilder: (_, i) {
              var place = _places[i];
              return ListTile(
                leading: Icon(Icons.place),
                title: Text(place.description),
              );
            },
          ),*/
        ],
      ),
    );
  }
}
