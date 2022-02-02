// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_history_country_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidHistoryCountryResponse _$CovidHistoryCountryResponseFromJson(
    Map<String, dynamic> json) {
  return CovidHistoryCountryResponse(
    timeline: CovidTimeline.fromJson(json['timeline'] as Map<String, dynamic>),
    country: json['country'] as String,
    province:
        (json['province'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$CovidHistoryCountryResponseToJson(
        CovidHistoryCountryResponse instance) =>
    <String, dynamic>{
      'country': instance.country,
      'province': instance.province,
      'timeline': instance.timeline.toJson(),
    };
