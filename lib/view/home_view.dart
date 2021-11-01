import 'package:dyma_trip/model/city_model.dart';
import 'package:dyma_trip/provider/city_provider.dart';
import 'package:dyma_trip/wigdet/city_card.dart';
import 'package:dyma_trip/wigdet/drawer.dart';
import 'package:dyma_trip/wigdet/dyma_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  static String ROUTE_NAME = "/";

  @override
  _HomeViewState createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    searchController.addListener(() {
        setState(() {});
      },
    );
    super.initState();
  }

  //----------------------------------------------------------------------------
  //----------------------- Destroy controller ---------------------------------
  //----------------------------------------------------------------------------

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CityProvider cityProvider = Provider.of<CityProvider>(context);
    List<City> filteredCities =
        cityProvider.filteredCities(searchController.text);

    return Scaffold(
      appBar: AppBar(
        title: Text("DymaTrip"),
      ),
      drawer: DrawerTrip(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Rechercher une ville",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(
                      () => searchController.clear(),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.all(10),
                child: RefreshIndicator(
                  onRefresh: Provider.of<CityProvider>(context).fetchData,
                  child: cityProvider.isLoading ? DymaLoader() : filteredCities.isNotEmpty
                      ? ListView.builder(
                          itemCount: filteredCities.length,
                          itemBuilder: (_, i) => CityCard(
                            city: filteredCities[i],
                          ),
                        ) : Text("Aucun résultat")
                ),
            ),
          ),
        ],
      ),
    );
  }
}
