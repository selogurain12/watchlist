// ignore_for_file: annotate_overrides, overridden_fields, non_constant_identifier_names

import 'package:whashlist/features/friendlist/domain/entities/friendlist_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:whashlist/features/user/data/models/user_model.dart';

part 'friendlist_model.g.dart';

@JsonSerializable()
class FriendlistRequestModel extends FriendlistRequestEntity {
  final List<UserRequestModel>? friends;

  const FriendlistRequestModel({
    this.friends,
}): super(
    friends: friends,
  );

  factory FriendlistRequestModel.fromJson(Map<String, dynamic> json) =>
    _$FriendlistRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$FriendlistRequestModelToJson(this);

  factory FriendlistRequestModel.fromEntity(FriendlistRequestEntity entity) {
    return FriendlistRequestModel(
      friends: entity.friends,
    );
  }
}

@JsonSerializable()
class FriendlistResponseModel extends FriendlistResponseEntity {
  final String? id;
  final List<UserResponseModel>? friends;

  const FriendlistResponseModel({
    this.id,
    this.friends
}): super(
    friends: friends,
    id: id,
  );

  factory FriendlistResponseModel.fromJson(Map<String, dynamic> json) =>
    _$FriendlistResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$FriendlistResponseModelToJson(this);

  factory FriendlistResponseModel.fromEntity(FriendlistResponseEntity entity) {
    return FriendlistResponseModel(
      id: entity.id,
      friends: entity.friends,
    );
  }
}