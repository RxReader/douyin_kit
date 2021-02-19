// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'douyin_access_token_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DouyinAccessTokenResp _$DouyinAccessTokenRespFromJson(
    Map<String, dynamic> json) {
  return DouyinAccessTokenResp(
    errorCode: json['error_code'] as int ?? 0,
    description: json['description'] as String,
    openId: json['open_id'] as String,
    accessToken: json['access_token'] as String,
    expiresIn: json['expires_in'] as int,
    refreshExpiresIn: json['refresh_expires_in'] as String,
    refreshToken: json['refresh_token'] as String,
    scope: json['scope'] as String,
  );
}

Map<String, dynamic> _$DouyinAccessTokenRespToJson(
        DouyinAccessTokenResp instance) =>
    <String, dynamic>{
      'error_code': instance.errorCode,
      'description': instance.description,
      'open_id': instance.openId,
      'access_token': instance.accessToken,
      'expires_in': instance.expiresIn,
      'refresh_expires_in': instance.refreshExpiresIn,
      'refresh_token': instance.refreshToken,
      'scope': instance.scope,
    };
