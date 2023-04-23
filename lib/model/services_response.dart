import 'package:json_annotation/json_annotation.dart';

part 'services_response.g.dart';

@JsonSerializable()
class ServicesResponse {
  final Map<int, String> services;

  ServicesResponse(this.services);

  factory ServicesResponse.fromJson(Map<String, dynamic> json) => _$ServicesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ServicesResponseToJson(this);
}