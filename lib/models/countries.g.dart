// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Countries _$CountriesFromJson(Map<String, dynamic> json) {
  return Countries(
    name: json['name'] as String,
    code: json['code'] as String,
    emoji: json['emoji'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$CountriesToJson(Countries instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'image': instance.image,
      'emoji': instance.emoji,
    };
