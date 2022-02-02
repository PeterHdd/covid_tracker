
import 'package:json_annotation/json_annotation.dart';

part 'covid_history_response.g.dart';

@JsonSerializable()
class CovidHistoryResponse 
{
  final Map<String,dynamic> cases;
  final Map<String,dynamic> deaths;
  final Map<String,dynamic> recovered;
  CovidHistoryResponse({required this.cases,required this.deaths,required this.recovered});


  factory CovidHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CovidHistoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CovidHistoryResponseToJson(this);
}