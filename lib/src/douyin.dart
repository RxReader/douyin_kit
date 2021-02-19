import 'dart:async';
import 'dart:convert' as convert;
import 'dart:io';

import 'package:douyin_kit/src/model/api/douyin_access_token_resp.dart';
import 'package:douyin_kit/src/model/api/douyin_entity.dart';
import 'package:douyin_kit/src/model/api/douyin_user_info_resp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

///
class Douyin {
  Douyin() {
    _channel.setMethodCallHandler(_handleMethod);
  }

  final MethodChannel _channel = const MethodChannel('v7lin.github.io/douyin_kit');

  Future<dynamic> _handleMethod(MethodCall call) async {
    //
  }

  /// 向抖音注册应用
  Future<void> registerApp({
    @required String clientKey,
  }) {
    assert(clientKey?.isNotEmpty ?? false);
    return _channel.invokeMethod<void>(
      'registerApp',
      <String, dynamic>{
        'client_key': clientKey,
      },
    );
  }

  ///
  Future<bool> isInstalled() {
    return _channel.invokeMethod<bool>('isInstalled');
  }

  ///
  Future<bool> isSupportAuth() {
    return _channel.invokeMethod<bool>('isSupportAuth');
  }

  ///
  Future<void> auth({
    @required List<String> scope,
    String state,
  }) {
    assert(scope?.isNotEmpty ?? false);
    return _channel.invokeMethod<void>(
      'auth',
      <String, dynamic>{
        'scope': scope.join(','),
        if (state != null) 'state': state,
      },
    );
  }

  /// https://open.douyin.com/platform/doc/6848806493387606024
  Future<DouyinEntity<DouyinAccessTokenResp>> getAccessToken({
    @required String clientKey,
    @required String clientSecret,
    @required String code,
    String grantType = 'authorization_code',
  }) {
    assert(clientKey?.isNotEmpty ?? false);
    assert(clientSecret?.isNotEmpty ?? false);
    assert(code?.isNotEmpty ?? false);
    assert(grantType?.isNotEmpty ?? false);
    return HttpClient()
        .getUrl(Uri.parse('https://open.douyin.com/oauth/access_token?client_key=$clientKey&client_secret=$clientSecret&code=$code&grant_type=$grantType'))
        .then((HttpClientRequest request) {
      return request.close();
    }).then<DouyinEntity<DouyinAccessTokenResp>>((HttpClientResponse response) async {
      if (response.statusCode == HttpStatus.ok) {
        String content = await convert.utf8.decodeStream(response);
        return DouyinEntity<DouyinAccessTokenResp>.fromJson(
          convert.json.decode(content) as Map<String, dynamic>,
          (Object json) => json != null ? DouyinAccessTokenResp.fromJson(json as Map<String, dynamic>) : null,
        );
      }
      throw HttpException('HttpResponse statusCode: ${response.statusCode}, reasonPhrase: ${response.reasonPhrase}.');
    });
  }

  /// https://open.douyin.com/platform/doc/6848806497707722765
  Future<DouyinEntity<DouyinAccessTokenResp>> refreshAccessToken({
    @required String clientKey,
    @required String refreshToken,
  }) {
    assert(clientKey?.isNotEmpty ?? false);
    assert(refreshToken?.isNotEmpty ?? false);
    return HttpClient().getUrl(Uri.parse('https://open.douyin.com/oauth/refresh_token?client_key=$clientKey&grant_type=refresh_token&refresh_token=$refreshToken')).then((HttpClientRequest request) {
      return request.close();
    }).then<DouyinEntity<DouyinAccessTokenResp>>((HttpClientResponse response) async {
      if (response.statusCode == HttpStatus.ok) {
        String content = await convert.utf8.decodeStream(response);
        return DouyinEntity<DouyinAccessTokenResp>.fromJson(
          convert.json.decode(content) as Map<String, dynamic>,
          (Object json) => json != null ? DouyinAccessTokenResp.fromJson(json as Map<String, dynamic>) : null,
        );
      }
      throw HttpException('HttpResponse statusCode: ${response.statusCode}, reasonPhrase: ${response.reasonPhrase}.');
    });
  }

  /// https://open.douyin.com/platform/doc/6848806527751489550
  Future<DouyinEntity<DouyinUserInfoResp>> getUserInfo({
    @required String openId,
    @required String accessToken,
  }) {
    return HttpClient().getUrl(Uri.parse('https://open.douyin.com/oauth/userinfo?open_id=$openId&access_token=$accessToken')).then((HttpClientRequest request) {
      return request.close();
    }).then<DouyinEntity<DouyinUserInfoResp>>((HttpClientResponse response) async {
      if (response.statusCode == HttpStatus.ok) {
        String content = await convert.utf8.decodeStream(response);
        return DouyinEntity<DouyinUserInfoResp>.fromJson(
          convert.json.decode(content) as Map<String, dynamic>,
          (Object json) => json != null ? DouyinUserInfoResp.fromJson(json as Map<String, dynamic>) : null,
        );
      }
      throw HttpException('HttpResponse statusCode: ${response.statusCode}, reasonPhrase: ${response.reasonPhrase}.');
    });
  }

  ///
  Future<bool> isSupportShare() {
    return _channel.invokeMethod<bool>('isSupportShare');
  }

  ///
  Future<void> shareImage({
    @required List<Uri> imageUris,
    String state,
  }) {
    assert(imageUris?.isNotEmpty ?? false);
    assert(imageUris.length <= 12 /*抖音12.3.0时为35*/);
    assert(imageUris.every((Uri element) => element != null && element.isScheme('file')));
    return _channel.invokeMethod<void>(
      'shareImage',
      <String, dynamic>{
        'image_uris': imageUris.map((Uri element) => element.toString()).toList(),
        if (state != null) 'state': state,
      },
    );
  }

  ///
  Future<void> shareVideo({
    @required List<Uri> videoUris,
    String state,
  }) {
    assert(videoUris?.isNotEmpty ?? false);
    assert(videoUris.length <= 12);
    assert(videoUris.every((Uri element) => element != null && element.isScheme('file')));
    return _channel.invokeMethod<void>(
      'shareVideo',
      <String, dynamic>{
        'video_uris': videoUris.map((Uri element) => element.toString()).toList(),
        if (state != null) 'state': state,
      },
    );
  }

  // /// TODO: 没有相关限制信息
  // Future<void> shareMicroApp({
  //   String id,
  //   String title,
  //   String url,
  //   String description,
  //   String state,
  // }) {
  //   assert(id?.isNotEmpty ?? false);
  //   return _channel.invokeMethod<void>(
  //     'shareMicroApp',
  //     <String, dynamic>{
  //       'id': id,
  //       'title': title,
  //       'url': url,
  //       'description': description,
  //       if (state != null) 'state': state,
  //     },
  //   );
  // }

  ///
  Future<void> shareHashTags({
    @required List<String> hashTags,
    String state,
  }) {
    assert(hashTags?.isNotEmpty ?? false);
    return _channel.invokeMethod<void>(
      'shareHashTags',
      <String, dynamic>{
        'hash_tags': hashTags,
        if (state != null) 'state': state,
      },
    );
  }

  // /// TODO: 文档都木有
  // Future<void> shareAnchor({
  //   String title,
  //   int businessType,
  //   String content,
  //   String state,
  // }) {
  //   return _channel.invokeMethod<void>(
  //     'shareAnchor',
  //     <String, dynamic>{
  //       'title': title,
  //       'business_type': businessType,
  //       'content': content,
  //       if (state != null) 'state': state,
  //     },
  //   );
  // }

  ///
  Future<bool> isSupportShareToContacts() {
    return _channel.invokeMethod<bool>('isSupportShareToContacts');
  }

  ///
  Future<void> shareImageToContacts({
    @required List<Uri> imageUris,
    String state,
  }) {
    assert(imageUris?.length == 1);
    assert(imageUris.every((Uri element) => element != null && element.isScheme('file')));
    return _channel.invokeMethod<void>(
      'shareImageToContacts',
      <String, dynamic>{
        'image_uris': imageUris.map((Uri element) => element.toString()).toList(),
        if (state != null) 'state': state,
      },
    );
  }

  ///
  Future<void> shareHtmlToContacts({
    @required String title,
    Uri thumbUrl,
    @required Uri url,
    @required String discription,
    String state,
  }) {
    assert(title?.isNotEmpty ?? false);
    assert(url != null && (url.isScheme('http') || url.isScheme('https')));
    return _channel.invokeMethod<void>(
      'shareToContacts',
      <String, dynamic>{
        'title': title,
        if (thumbUrl != null) 'thumb_url': thumbUrl.toString(),
        'url': url.toString(),
        'discription': discription,
        if (state != null) 'state': state,
      },
    );
  }

  ///
  Future<bool> isSupportOpenRecord() {
    return _channel.invokeMethod<bool>(
      'isSupportOpenRecord',
    );
  }

  ///
  Future<void> openRecord({
    String state,
  }) {
    return _channel.invokeMethod<void>(
      'openRecord',
      <String, dynamic>{
        if (state != null) 'state': state,
      },
    );
  }
}
