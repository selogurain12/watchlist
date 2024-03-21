// ignore_for_file: annotate_overrides, overridden_fields, non_constant_identifier_names

import 'package:whashlist/features/friendlist/domain/entities/friendlist_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'friendlist_model.g.dart';

@JsonSerializable()
class FriendlistRequestModel extends FriendlistRequestEntity {
  final String? userprincipal;
  final String? user2;

  const FriendlistRequestModel({
    this.userprincipal,
    this.user2,
}): super(
    userprincipal: userprincipal,
    user2: user2,
  );

  factory FriendlistRequestModel.fromJson(Map<String, dynamic> json) =>
    _$FriendlistRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$FriendlistRequestModelToJson(this);

  factory FriendlistRequestModel.fromEntity(FriendlistRequestEntity entity) {
    return FriendlistRequestModel(
      userprincipal: entity.userprincipal,
      user2: entity.user2
    );
  }
}

@JsonSerializable()
class FriendlistResponseModel extends FriendlistResponseEntity {
  final String? id;
  final String? userprincipal;
  final String? user2;

  const FriendlistResponseModel({
    this.id,
    this.userprincipal,
    this.user2
}): super(
    id: id,
    userprincipal: userprincipal,
    user2: user2
  );

  factory FriendlistResponseModel.fromJson(Map<String, dynamic> json) =>
    _$FriendlistResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$FriendlistResponseModelToJson(this);

  factory FriendlistResponseModel.fromEntity(FriendlistResponseEntity entity) {
    return FriendlistResponseModel(
      id: entity.id,
      userprincipal: entity.userprincipal,
      user2: entity.user2,
    );
  }
}

@JsonSerializable()
class UserPrincipalRequestModel extends UserPrincipalRequestEntity {
  final String? userprincipal;

  const UserPrincipalRequestModel({
    this.userprincipal,
}): super(
    userprincipal: userprincipal,
  );

  factory UserPrincipalRequestModel.fromJson(Map<String, dynamic> json) =>
    _$UserPrincipalRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserPrincipalRequestModelToJson(this);

  factory UserPrincipalRequestModel.fromEntity(UserPrincipalRequestEntity entity) {
    return UserPrincipalRequestModel(
      userprincipal: entity.userprincipal,
    );
  }
}

@JsonSerializable()
class UserFriendRequestModel extends UserFriendRequestEntity {
  final String? userprincipal;
  final String? user2;

  const UserFriendRequestModel({
    this.userprincipal,
    this.user2,
}): super(
    userprincipal: userprincipal,
    user2: user2,
  );

  factory UserFriendRequestModel.fromJson(Map<String, dynamic> json) =>
    _$UserFriendRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserFriendRequestModelToJson(this);

  factory UserFriendRequestModel.fromEntity(UserFriendRequestEntity entity) {
    return UserFriendRequestModel(
      userprincipal: entity.userprincipal,
      user2: entity.user2,
    );
  }
}
