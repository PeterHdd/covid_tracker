import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Constants {
  
  ///bottom nav bar items
  static const bottomNavWorld = "World";
  static const bottomNavStats = "Stats";
  static const bottomNavVaccine = "Vaccine";

  //pages title
  static const titleWorldStatistics = "World Statistics";
  static const countryStatistics = "Countries Statistics";
  static const covidTimeLine = 'Covid-19 Timeline';
  static const covidDeath = "death";
  static const covidCases = "cases";
  static const covidRecovered = "Recovered";
  static const covidActive = "Active";
  static const covidTracker = "Covid Tracker";
  static const covidConfirmed = "Confirmed";
  static const covidDeceased = "Deceased";
  static const covidTodayCases = "Today's Cases:";
  static const covidTodayDeath = "Today's Death:";
  static const covidUpdated = "Last updated";
  static const covidSearch = "Search";
  static const covidLocation = "Invalid Location";
  static const covidTotal = "Vaccination Total";

  //endpoints
  static const covidURL = "https://disease.sh/v3/covid-19/";
  static const countriesURL = "assets/data/countries.json";

  //countries code
  static const unitedKingdom = "United Kingdom";
  static const unitedKingdomCode = "UK";
  static const unitedStates = "United States";
  static const unitedStatesCode = "USA";
  static const southKorea = "South Korea";
  static const southKoreaCode = "KR";

  //colors
  static const casesColor = Color(0xFFFDE6EC);
  static const textCasesColor = Color(0xFFD83459);
  static const activeColor = Color(0xFFE8F2FF);
  static const textActiveColor = Color(0xFF2179E3);
  static const recoveredColor = Color(0xFFE6F2EC);
  static const textRecoveredColor = Color(0xFF369F4E);
  static const deceasedColor = Color(0xFFEFF1F3);
  static const textDeceasedColor = Color(0xFF737981);

  //status bar color
  static const statusBarColor = SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark, 
      statusBarColor: Colors.transparent);
}
