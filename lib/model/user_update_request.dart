import 'package:json_annotation/json_annotation.dart';

part 'user_update_request.g.dart';

@JsonSerializable()
class UserUpdateRequest {

  final int id;

  @JsonKey(includeIfNull: false)
  final String name;

  @JsonKey(includeIfNull: false)
  final String description;

  @JsonKey(includeIfNull: false)
  final List<int> services;

  UserUpdateRequest(this.id, this.name, this.services, this.description);

  factory UserUpdateRequest.fromJson(Map<String, dynamic> json) => _$UserUpdateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserUpdateRequestToJson(this);

}
