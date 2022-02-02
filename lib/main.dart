import 'package:covid_tracker/components/bottom_nav_bar.dart';
import 'package:covid_tracker/di/service_locator.dart';
import 'package:covid_tracker/features/country-stats/country_view_detail_view_model.dart';
import 'package:covid_tracker/nav_view_model.dart';
import 'package:covid_tracker/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = Constants.covidTracker;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NavViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => CountryViewDetailViewModel(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: _title,
        home: BottomNavBar(),
      ),
    );
  }
}
