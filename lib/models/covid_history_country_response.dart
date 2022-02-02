
import 'package:json_annotation/json_annotation.dart';
import 'covid_timeline.dart';

part 'covid_history_country_response.g.dart';


@JsonSerializable(explicitToJson: true)
class CovidHistoryCountryResponse 
{
  final String country;
  final List<String> province;
  final CovidTimeline timeline;
  CovidHistoryCountryResponse({required this.timeline,required this.country,required this.province});


  factory CovidHistoryCountryResponse.fromJson(Map<String, dynamic> json) =>
      _$CovidHistoryCountryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CovidHistoryCountryResponseToJson(this);
}