// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friendlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendlistRequestModel _$FriendlistRequestModelFromJson(
        Map<String, dynamic> json) =>
    FriendlistRequestModel(
      userprincipal: json['userprincipal'] as String?,
      user2: json['user2'] as String?,
    );

Map<String, dynamic> _$FriendlistRequestModelToJson(
        FriendlistRequestModel instance) =>
    <String, dynamic>{
      'userprincipal': instance.userprincipal,
      'user2': instance.user2,
    };

FriendlistResponseModel _$FriendlistResponseModelFromJson(
        Map<String, dynamic> json) =>
    FriendlistResponseModel(
      id: json['id'] as String?,
      userprincipal: json['userprincipal'] as String?,
      user2: json['user2'] as String?,
    );

Map<String, dynamic> _$FriendlistResponseModelToJson(
        FriendlistResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userprincipal': instance.userprincipal,
      'user2': instance.user2,
    };

UserPrincipalRequestModel _$UserPrincipalRequestModelFromJson(
        Map<String, dynamic> json) =>
    UserPrincipalRequestModel(
      userprincipal: json['userprincipal'] as String?,
    );

Map<String, dynamic> _$UserPrincipalRequestModelToJson(
        UserPrincipalRequestModel instance) =>
    <String, dynamic>{
      'userprincipal': instance.userprincipal,
    };

UserFriendRequestModel _$UserFriendRequestModelFromJson(
        Map<String, dynamic> json) =>
    UserFriendRequestModel(
      userprincipal: json['userprincipal'] as String?,
      user2: json['user2'] as String?,
    );

Map<String, dynamic> _$UserFriendRequestModelToJson(
        UserFriendRequestModel instance) =>
    <String, dynamic>{
      'userprincipal': instance.userprincipal,
      'user2': instance.user2,
    };

DeleteResponseModel _$DeleteResponseModelFromJson(Map<String, dynamic> json) =>
    DeleteResponseModel(
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DeleteResponseModelToJson(
        DeleteResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
