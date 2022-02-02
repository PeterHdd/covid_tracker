
import 'package:json_annotation/json_annotation.dart';

part 'countries.g.dart';

@JsonSerializable()
class Countries {
  final String name;
  final String code;
  final String image;
  final String emoji;
  Countries({required this.name,required this.code,required this.emoji,required this.image});


  factory Countries.fromJson(Map<String, dynamic> json) =>
      _$CountriesFromJson(json);
  Map<String, dynamic> toJson() => _$CountriesToJson(this);
}