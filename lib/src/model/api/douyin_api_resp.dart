import 'package:json_annotation/json_annotation.dart';

abstract class DouyinApiResp {
  const DouyinApiResp({
    this.errorCode,
    this.description,
  });

  /// 成功
  static const int ERRORCODE_SUCCESS = 0;

  @JsonKey(defaultValue: ERRORCODE_SUCCESS)
  final int errorCode;
  final String description;

  bool get isSuccessful => errorCode == ERRORCODE_SUCCESS;
}
