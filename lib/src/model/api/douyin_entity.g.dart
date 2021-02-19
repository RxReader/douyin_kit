// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'douyin_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DouyinEntity<T> _$DouyinEntityFromJson<T extends DouyinApiResp>(
  Map<String, dynamic> json,
  T Function(Object json) fromJsonT,
) {
  return DouyinEntity<T>(
    message: json['message'] as String,
    data: fromJsonT(json['data']),
    extra: json['extra'] == null
        ? null
        : DouyinExtra.fromJson(json['extra'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DouyinEntityToJson<T extends DouyinApiResp>(
  DouyinEntity<T> instance,
  Object Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'message': instance.message,
      'data': toJsonT(instance.data),
      'extra': instance.extra?.toJson(),
    };

DouyinExtra _$DouyinExtraFromJson(Map<String, dynamic> json) {
  return DouyinExtra(
    logid: json['logid'] as String,
    now: json['now'] as int,
  );
}

Map<String, dynamic> _$DouyinExtraToJson(DouyinExtra instance) =>
    <String, dynamic>{
      'logid': instance.logid,
      'now': instance.now,
    };
