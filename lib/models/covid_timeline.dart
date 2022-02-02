import 'package:json_annotation/json_annotation.dart';

part 'covid_timeline.g.dart';

@JsonSerializable()
class CovidTimeline 
{
  final Map<String,dynamic> cases;
  final Map<String,dynamic> deaths;
  final Map<String,dynamic> recovered;
  CovidTimeline({required this.cases,required this.deaths,required this.recovered});

    factory CovidTimeline.fromJson(Map<String, dynamic> json) =>
      _$CovidTimelineFromJson(json);
  Map<String, dynamic> toJson() => _$CovidTimelineToJson(this);
}