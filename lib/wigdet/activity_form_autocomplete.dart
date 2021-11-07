import 'dart:async';

import 'package:dyma_trip/api/google_api.dart';
import 'package:dyma_trip/model/location_activity_model.dart';
import 'package:dyma_trip/model/place_model.dart';
import 'package:flutter/material.dart';

Future<LocationActivity?> showInputAutoComplete(BuildContext context) async {
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
  List<Place> _places = [];
  Timer? _debounce;

  //----------------------------------------------------------------------------
  //----------------------- Search address -------------------------------------
  //----------------------------------------------------------------------------

  Future<void> _searchAddress(String value) async {
    try {
      if(_debounce?.isActive == true) _debounce?.cancel();
      _debounce = Timer(Duration(seconds: 1), () async {
            if (value.isNotEmpty) {
              print(value);
              _places = await getAutocompleteSuggestions(value);
              setState(() {});
            }
          });
    } catch (e) {
      rethrow;
    }
  }

  //----------------------------------------------------------------------------
  //----------------------- Get place details ----------------------------------
  //----------------------------------------------------------------------------

  Future<void> getPlaceDetails(String placeId) async {
    try {
      LocationActivity location = await getPlaceAutocompleteDetails(placeId);
      if (location != null) {
        print(location);
        Navigator.pop(context, location);
      } else {
        Navigator.pop(context);
      }
    } catch (e) {
      rethrow;
    }
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
                    icon: Icon(Icons.clear),
                    onPressed: () => Navigator.pop(context),
                  ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _places.length,
              itemBuilder: (_, i) {
                var place = _places[i];
                return ListTile(
                  leading: Icon(Icons.place),
                  title: Text(place.description),
                  onTap: () => getPlaceDetails(place.placeId),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}

