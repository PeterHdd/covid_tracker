// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccination_timeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaccinationTimeline _$VaccinationTimelineFromJson(Map<String, dynamic> json) {
  return VaccinationTimeline(
    total: (json['total'] as num).toDouble(),
    daily: (json['daily'] as num).toDouble(),
    totalPerHundred: (json['totalPerHundred'] as num).toDouble(),
    dailyPerMillion: (json['dailyPerMillion'] as num).toDouble(),
    date: json['date'] as String,
  );
}

Map<String, dynamic> _$VaccinationTimelineToJson(
        VaccinationTimeline instance) =>
    <String, dynamic>{
      'total': instance.total,
      'daily': instance.daily,
      'totalPerHundred': instance.totalPerHundred,
      'dailyPerMillion': instance.dailyPerMillion,
      'date': instance.date,
    };
