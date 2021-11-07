import 'package:dyma_trip/model/location_activity_model.dart';
import 'package:dyma_trip/model/place_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//TODO: Remove api key
const GOOGLE_API_KEY = "";

  //----------------------------------------------------------------------------
  //----------------------- Get encoded url ------------------------------------
  //----------------------------------------------------------------------------

  Uri _queryAutocompleteBuilder(String query) {
    return Uri.parse(
        "https://maps.googleapis.com/maps/api/place/queryautocomplete/json?&key=$GOOGLE_API_KEY&input=$query");
  }

  //----------------------------------------------------------------------------
  //----------------------- Get encoded place details --------------------------
  //----------------------------------------------------------------------------

  Uri _queryPlaceDetailsBuilder(String placeId) {
    return Uri.parse(
        "https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&fields=formatted_address,geometry&key=$GOOGLE_API_KEY");
  }

  //----------------------------------------------------------------------------
  //----------------------- Get encoded current location -----------------------
  //----------------------------------------------------------------------------

  Uri _queryGetAddressFromLatLngBuilder({required double lat, required double lng}) {
    return Uri.parse("https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY");
  }

  //----------------------------------------------------------------------------
  //----------------------- Get places -----------------------------------------
  //----------------------------------------------------------------------------

  Future<List<Place>> getAutocompleteSuggestions(String query) async {
    try {
      var response = await http.get(_queryAutocompleteBuilder(query));
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        return (body["predictions"] as List)
            .map(
              (suggestion) => Place(
                  placeId: suggestion["place_id"],
                  description: suggestion["description"],
              ),
            )
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }

  //----------------------------------------------------------------------------
  //----------------------- Get place details ----------------------------------
  //----------------------------------------------------------------------------

  Future<LocationActivity> getPlaceAutocompleteDetails(String placeId) async {
    try {
      var response = await http.get(_queryPlaceDetailsBuilder(placeId));
      if (response.statusCode == 200) {
        var body = json.decode(response.body)["result"];
        return LocationActivity(
          address: body["formatted_address"], //TODO check
          latitude: body["geometry"]["location"]["lat"],
          longitude: body["geometry"]["location"]["lng"],
        );
      } else {
        throw "Error";
      }
    } catch (e) {
      rethrow;
    }
  }

  //----------------------------------------------------------------------------
  //----------------------- Get current location -------------------------------
  //----------------------------------------------------------------------------

  Future<String> getAddressFromLatLng({required double lat, required double lng}) async {
    try {
      var response = await http.get(_queryGetAddressFromLatLngBuilder(lat: lat, lng: lng));
      if (response.statusCode == 200) {
        return json.decode(response.body)["results"][0]["formatted_address"];
      } else {
        throw "Error";
      }
    } catch (e) {
      rethrow;
    }
  }
