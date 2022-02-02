// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccination_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaccinationResponse _$VaccinationResponseFromJson(Map<String, dynamic> json) {
  return VaccinationResponse(
    country: json['country'] as String,
    timeline: (json['timeline'] as List<dynamic>)
        .map((e) => VaccinationTimeline.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$VaccinationResponseToJson(
        VaccinationResponse instance) =>
    <String, dynamic>{
      'country': instance.country,
      'timeline': instance.timeline,
    };
