// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friendlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendlistRequestModel _$FriendlistRequestModelFromJson(
        Map<String, dynamic> json) =>
    FriendlistRequestModel(
      friends: (json['friends'] as List<dynamic>?)
          ?.map((e) => UserRequestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FriendlistRequestModelToJson(
        FriendlistRequestModel instance) =>
    <String, dynamic>{
      'friends': instance.friends,
    };

FriendlistResponseModel _$FriendlistResponseModelFromJson(
        Map<String, dynamic> json) =>
    FriendlistResponseModel(
      id: json['id'] as String?,
      friends: (json['friends'] as List<dynamic>?)
          ?.map((e) => UserResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FriendlistResponseModelToJson(
        FriendlistResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'friends': instance.friends,
    };
