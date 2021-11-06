import 'dart:convert';

import 'package:dyma_trip/model/place_model.dart';
import 'package:http/http.dart' as http;

//TODO: Remove api key
const GOOGLE_API_KEY = "";


  //----------------------------------------------------------------------------
  //----------------------- Get encoded url ------------------------------------
  //----------------------------------------------------------------------------

  Uri _queryAutocompleteBuilder(String query) {
    return Uri.parse("https://maps.googleapis.com/maps/api/place/queryautocomplete/json?&key=$GOOGLE_API_KEY&input=$query");
  }


  //----------------------------------------------------------------------------
  //----------------------- Get places -----------------------------------------
  //----------------------------------------------------------------------------

  Future<List<Place>> getAutocompleteSuggestions(String query) async {
    try {
      var response = await http.get(_queryAutocompleteBuilder(query));
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        return (body["predictions"] as List).map(
                (suggestion) => Place(
                  placeId: suggestion["place_id"],
                  description: suggestion["description"],
                )
        ).toList();
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }

