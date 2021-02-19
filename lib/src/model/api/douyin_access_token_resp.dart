import 'package:douyin_kit/src/model/api/douyin_api_resp.dart';
import 'package:json_annotation/json_annotation.dart';

part 'douyin_access_token_resp.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class DouyinAccessTokenResp extends DouyinApiResp {
  const DouyinAccessTokenResp({
    int errorCode,
    String description,
    this.openId,
    this.accessToken,
    this.expiresIn,
    this.refreshExpiresIn,
    this.refreshToken,

    this.scope,
  }) : super(errorCode: errorCode, description: description);

  factory DouyinAccessTokenResp.fromJson(Map<String, dynamic> json) => _$DouyinAccessTokenRespFromJson(json);

  final String openId;
  final String accessToken;
  final int expiresIn;
  final String refreshExpiresIn;
  final String refreshToken;
  final String scope;

  Map<String, dynamic> toJson() => _$DouyinAccessTokenRespToJson(this);
}
