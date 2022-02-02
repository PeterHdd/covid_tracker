// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovidHistoryResponse _$CovidHistoryResponseFromJson(Map<String, dynamic> json) {
  return CovidHistoryResponse(
    cases: json['cases'] as Map<String, dynamic>,
    deaths: json['deaths'] as Map<String, dynamic>,
    recovered: json['recovered'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$CovidHistoryResponseToJson(
        CovidHistoryResponse instance) =>
    <String, dynamic>{
      'cases': instance.cases,
      'deaths': instance.deaths,
      'recovered': instance.recovered,
    };
