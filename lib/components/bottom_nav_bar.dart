import 'package:covid_tracker/features/country-stats/country_view.dart';
import 'package:covid_tracker/features/vaccination-stats/vaccination_view.dart';
import 'package:covid_tracker/features/world-stats/world_view.dart';
import 'package:covid_tracker/nav_view_model.dart';
import 'package:covid_tracker/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
   const BottomNavBar({Key? key}) : super(key: key);

  static const List<Widget> tabs = <Widget>[
    WorldView(),
    CountryView(),
    VaccinationView()
  ];

  @override
  Widget build(BuildContext context) {
    NavViewModel viewModel = Provider.of<NavViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: tabs.elementAt(viewModel.selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: Constants.bottomNavWorld,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage),
            label: Constants.bottomNavStats,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: Constants.bottomNavVaccine,
          ),
        ],
        currentIndex: viewModel.selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: viewModel.onItemTapped,
      ),
    );
  }
}