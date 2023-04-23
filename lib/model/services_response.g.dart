// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicesResponse _$ServicesResponseFromJson(Map<String, dynamic> json) =>
    ServicesResponse(
      (json['services'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), e as String),
      ),
    );

Map<String, dynamic> _$ServicesResponseToJson(ServicesResponse instance) =>
    <String, dynamic>{
      'services': instance.services.map((k, e) => MapEntry(k.toString(), e)),
    };
