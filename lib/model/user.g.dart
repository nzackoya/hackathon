// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as int,
      json['name'] as String,
      json['type'] as String,
      (json['services'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(int.parse(k), e as String),
      ),
      (json['docs'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['description'] as String,
      json['email'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'services': instance.services?.map((k, e) => MapEntry(k.toString(), e)),
      'docs': instance.docs,
    };
