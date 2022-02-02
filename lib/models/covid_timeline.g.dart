// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_timeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidTimeline _$CovidTimelineFromJson(Map<String, dynamic> json) {
  return CovidTimeline(
    cases: json['cases'] as Map<String, dynamic>,
    deaths: json['deaths'] as Map<String, dynamic>,
    recovered: json['recovered'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$CovidTimelineToJson(CovidTimeline instance) =>
    <String, dynamic>{
      'cases': instance.cases,
      'deaths': instance.deaths,
      'recovered': instance.recovered,
    };
