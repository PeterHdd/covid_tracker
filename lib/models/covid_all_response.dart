
import 'package:json_annotation/json_annotation.dart';

part 'covid_all_response.g.dart';

@JsonSerializable()
class CovidAllResponse {
  final int updated;
  final int cases;
  final int todayDeaths;
  final int todayCases;
  final int deaths;
  final int recovered;
  final int todayRecovered;
  final int active;
  final int critical;
  final double casesPerOneMillion;
  final double deathsPerOneMillion;
  final int tests;
  final double testsPerOneMillion;
  final int population;
  final int oneCasePerPeople;
  final int oneDeathPerPeople;
  final int oneTestPerPeople;
  final double activePerOneMillion;
  final double recoveredPerOneMillion;
  final double criticalPerOneMillion;
  final int affectedCountries;
  CovidAllResponse({
    required this.todayDeaths,
    required this.updated,
    required this.cases,
    required this.todayCases,
    required this.deaths,
    required this.recovered,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.casesPerOneMillion,
    required this.deathsPerOneMillion,
    required this.tests,
    required this.testsPerOneMillion,
    required this.population,
    required this.oneCasePerPeople,
    required this.oneDeathPerPeople,
    required this.oneTestPerPeople,
    required this.activePerOneMillion,
    required this.recoveredPerOneMillion,
    required this.criticalPerOneMillion,
    required this.affectedCountries,
  });
  

  factory CovidAllResponse.fromJson(Map<String, dynamic> json) =>
      _$CovidAllResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CovidAllResponseToJson(this);
}
