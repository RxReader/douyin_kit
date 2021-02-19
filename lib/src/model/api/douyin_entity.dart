import 'package:douyin_kit/src/model/api/douyin_api_resp.dart';
import 'package:json_annotation/json_annotation.dart';

part 'douyin_entity.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
  genericArgumentFactories: true,
)
class DouyinEntity<T extends DouyinApiResp> {
  const DouyinEntity({
    this.message,
    this.data,
    this.extra,
  });

  factory DouyinEntity.fromJson(Map<String, dynamic> json, T Function(Object json) fromJsonT) => _$DouyinEntityFromJson<T>(json, fromJsonT);

  final String message;
  final T data;
  final DouyinExtra extra;

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$DouyinEntityToJson<T>(this, toJsonT);
}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class DouyinExtra {
  const DouyinExtra({
    this.logid,
    this.now,
  });

  factory DouyinExtra.fromJson(Map<String, dynamic> json) => _$DouyinExtraFromJson(json);

  final String logid;
  final int now;

  Map<String, dynamic> toJson() => _$DouyinExtraToJson(this);
}
