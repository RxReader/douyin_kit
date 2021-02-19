// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'douyin_user_info_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DouyinUserInfoResp _$DouyinUserInfoRespFromJson(Map<String, dynamic> json) {
  return DouyinUserInfoResp(
    errorCode: json['error_code'] as int ?? 0,
    description: json['description'] as String,
    openId: json['open_id'] as String,
    unionId: json['union_id'] as String,
    eAccountRole: json['e_account_role'] as String,
    nickname: json['nickname'] as String,
    avatar: json['avatar'] as String,
    gender: json['gender'] as int,
    country: json['country'] as String,
    province: json['province'] as String,
    city: json['city'] as String,
  );
}

Map<String, dynamic> _$DouyinUserInfoRespToJson(DouyinUserInfoResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'description': instance.description,
      'open_id': instance.openId,
      'union_id': instance.unionId,
      'e_account_role': instance.eAccountRole,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'gender': instance.gender,
      'country': instance.country,
      'province': instance.province,
      'city': instance.city,
    };
