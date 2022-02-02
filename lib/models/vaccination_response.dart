
import 'package:covid_tracker/models/vaccination_timeline.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vaccination_response.g.dart';

@JsonSerializable()
class VaccinationResponse {
  final String country;
  final List<VaccinationTimeline> timeline;

  VaccinationResponse({required this.country,required this.timeline});


  factory VaccinationResponse.fromJson(Map<String, dynamic> json) =>
      _$VaccinationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VaccinationResponseToJson(this);
}