import 'package:dyma_trip/model/activity_model.dart';
import 'package:dyma_trip/provider/trip_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class GoogleMapsView extends StatefulWidget {
  static const String ROUTE_NAME = "/maps";

  const GoogleMapsView({Key? key}) : super(key: key);

  @override
  _GoogleMapsViewState createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  bool _isLoaded = false;
  late Activity _activity;
  late GoogleMapController _googleMapController;

  @override
  void didChangeDependencies() {
    if (!_isLoaded) {
      var arguments = ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
      _activity = Provider.of<TripProvider>(context, listen: false).getActivitiesById(
          activityId: arguments["activityId"]!,
          tripId: arguments["tripId"]!,
      );
    }
    super.didChangeDependencies();
  }

  //----------------------------------------------------------------------------
  //----------------------- Get initial position -------------------------------
  //----------------------------------------------------------------------------

  get _initialCameraPosition {
    return CameraPosition(
      target: _activityLatLng,
      zoom: 16,
    );
  }

  //----------------------------------------------------------------------------
  //----------------------- Get activity position ------------------------------
  //----------------------------------------------------------------------------

  get _activityLatLng {
    return LatLng(_activity.location!.latitude!, _activity.location!.longitude!);
  }

  //----------------------------------------------------------------------------
  //----------------------- Open url -------------------------------------------
  //----------------------------------------------------------------------------

  void _openUrl(){
    print("Should open url");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_activity.name),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        onMapCreated: (controller) => _googleMapController = controller,
        initialCameraPosition: _initialCameraPosition,
        markers: Set.of([
          Marker(
            markerId: MarkerId("marker"),
            flat: true,
            position: _activityLatLng,
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.directions_car),
        onPressed: _openUrl,
        label: Text("Go"),
      ),
    );
  }
}
