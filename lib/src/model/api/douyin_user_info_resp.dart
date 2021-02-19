import 'package:douyin_kit/src/model/api/douyin_api_resp.dart';
import 'package:json_annotation/json_annotation.dart';

part 'douyin_user_info_resp.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class DouyinUserInfoResp extends DouyinApiResp {
  const DouyinUserInfoResp({
    int errorCode,
    String description,
    this.openId,
    this.unionId,
    this.eAccountRole,
    this.nickname,
    this.avatar,
    this.gender,
    this.country,
    this.province,
    this.city,
  }) : super(errorCode: errorCode, description: description);

  factory DouyinUserInfoResp.fromJson(Map<String, dynamic> json) => _$DouyinUserInfoRespFromJson(json);

  static const int GENDER_UNKNOWN = 0;
  static const int GENDER_MALE = 1;
  static const int GENDER_FEMALE = 2;

  final String openId;
  final String unionId;
  final String eAccountRole;
  final String nickname;
  final String avatar;
  final int gender;
  final String country;
  final String province;
  final String city;

  Map<String, dynamic> toJson() => _$DouyinUserInfoRespToJson(this);
}
