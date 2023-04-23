import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {

  final int id;
  final String email;
  String name;
  String description;

  final String type;

  Map<int, String>? services;

  List<String>? docs;

  User(this.id, this.name, this.type, this.services, this.docs, this.description, this.email);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}
