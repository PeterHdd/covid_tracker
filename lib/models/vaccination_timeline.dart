import 'package:json_annotation/json_annotation.dart';

part 'vaccination_timeline.g.dart';

@JsonSerializable()
class VaccinationTimeline {
  final double total;
  final double daily;
  final double totalPerHundred;
  final double dailyPerMillion;
  final String date;

  VaccinationTimeline({required this.total,required this.daily,required this.totalPerHundred,required this.dailyPerMillion,required this.date});

    factory VaccinationTimeline.fromJson(Map<String, dynamic> json) =>
      _$VaccinationTimelineFromJson(json);
  Map<String, dynamic> toJson() => _$VaccinationTimelineToJson(this);
}