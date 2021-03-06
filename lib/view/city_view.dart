import 'package:dyma_trip/model/activity_model.dart';
import 'package:dyma_trip/model/city_model.dart';
import 'package:dyma_trip/provider/city_provider.dart';
import 'package:dyma_trip/provider/trip_provider.dart';
import 'package:dyma_trip/view/home_view.dart';
import 'package:dyma_trip/wigdet/activity_list.dart';
import 'package:dyma_trip/wigdet/drawer.dart';
import 'package:dyma_trip/wigdet/trip_activity_list.dart';
import 'package:dyma_trip/wigdet/trip_overview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/trip_model.dart';
import 'activity_form_view.dart';

class CityView extends StatefulWidget {
  static const String ROUTE_NAME = "/city";
  //final Function addTrip;

  //final List<Activity> activities = data.activities;

  //----------------------------------------------------------------------------
  //----------------------- Responsive design ----------------------------------
  //----------------------------------------------------------------------------

  showContext({required BuildContext context, required List<Widget> children}){
    var orientation = MediaQuery.of(context).orientation;

    if(orientation == Orientation.landscape){
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );
    }
    else {
      return Column(children: children,);
    }
  }

  CityView({Key? key, /*required this.addTrip*/}) : super(key: key);

  @override
  _CityViewState createState() => _CityViewState();
}

class _CityViewState extends State<CityView> {
  late Trip trip;
  late int index;

  //----------------------------------------------------------------------------
  //----------------------- Initialize variables in initState ------------------
  //----------------------------------------------------------------------------

  @override
  void initState() {
    trip = Trip(city: /*widget.city.name*/null, activities: [], date: null);
    index = 0;
    super.initState();
  }

  //----------------------------------------------------------------------------
  //----------------------- Show Date picker -----------------------------------
  //----------------------------------------------------------------------------

  void setDate(){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2486)
    ).then((selectedDate) {
      if(selectedDate != null) {
        setState(() {
          trip.date = selectedDate;
        });
      }
    });
  }

  //----------------------------------------------------------------------------
  //----------------------- Toggle activity on click  --------------------------
  //----------------------------------------------------------------------------

  void toggleActivity(Activity activity){
    setState(() {
      trip.activities.contains(activity) ? trip.activities.remove(activity) : trip.activities.add(activity);
    });
  }

  //----------------------------------------------------------------------------
  //----------------------- Get activities list --------------------------------
  //----------------------------------------------------------------------------

  /*List<Activity> get activities {
    return city.activities;
  }*/

  //----------------------------------------------------------------------------
  //----------------------- Get trip price -------------------------------------
  //----------------------------------------------------------------------------

  double get amount {
    return trip.activities.fold(0.00, (previousValue, element) {
      return previousValue + element.price;
    });
  }

  //----------------------------------------------------------------------------
  //----------------------- Delete activity ------------------------------------
  //----------------------------------------------------------------------------

  void deleteTripActivity(Activity activity) {
    setState(() {
      trip.activities.remove(activity);
    });
  }

  //----------------------------------------------------------------------------
  //----------------------- Save Trip Dialog box -------------------------------
  //----------------------------------------------------------------------------

  void saveTrip(String cityName) async{
    final result = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Voulez vous sauvegarder ce voyage ?"),
            contentPadding: EdgeInsets.all(20),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: () {
                    Navigator.pop(context, "Cancel");
                  }, child: Text("Annuler"),
                  ),
                  SizedBox(width: 30,),
                  ElevatedButton(onPressed: () {
                    Navigator.pop(context, "Save");
                  },
                    child: Text("Sauvegarder"),
                  ),
                ],
              ),
            ],
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.white,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          );
        }
    );
    if(trip.date == null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Attention !"),
              content: Text("Vous n'avez pas s??lectionn?? de date"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok"),
                ),
              ],
            );
          },
      );
    }
    else if(result == "Save"){
      //widget.addTrip(trip);
      trip.city = cityName;
      Provider.of<TripProvider>(context, listen: false).addTrip(trip);
      Navigator.pushNamed(context, HomeView.ROUTE_NAME);
    }
  }

  //----------------------------------------------------------------------------
  //----------------------- Click on Navigation bottom bar ---------------------
  //----------------------------------------------------------------------------

  void switchIndex(selectedIndex){
    setState(() {
      index = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    String cityName = ModalRoute.of(context)!.settings.arguments as String;
    City city = Provider.of<CityProvider>(context).getCityByName(cityName);

    return Scaffold(
      appBar: AppBar(
        title: Text("Organisation du voyage"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(
                context, ActivityFormView.ROUTE_NAME,
                arguments: cityName),
          ),
        ],
      ),
      drawer: DrawerTrip(),
      body: Container(
        child: widget.showContext(
            context: context,
            children: [
              TripOverview(cityName: city.name, trip: trip, setDate: setDate, amount: amount, cityImage: city.image,),
              Expanded(
                child: index == 0 ? ActivityList(
                  activities: city.activities,
                  selectedActivities: trip.activities,
                  toggleActivity: toggleActivity,
                ) : TripActivityList(
                  activities: trip.activities,
                  deleteTripActivity: deleteTripActivity,
                ),
              ),
            ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          saveTrip(city.name);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.map), label: "D??couverte"),
            BottomNavigationBarItem(icon: Icon(Icons.stars), label: "Mes activit??s"),
          ],
        onTap: switchIndex,
      ),
    );
  }
}
