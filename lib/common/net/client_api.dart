import 'dart:developer';

import 'package:yyba_app/model/services_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'client_api.g.dart';

@RestApi()
abstract class ClientApi {
  factory ClientApi(Dio dio, {String baseUrl}) = _ClientApi;

  ///发送短信
  @POST("/sms/send")
  Future<dynamic> sendSms(
    @Field() String phone,
    @Field() String gbcode,
    @Field() String businessType,
  );

  ///登陆
  @POST("/login")
  Future<dynamic> login(
    @Field() String phone,
    @Field() String gbcode,
    @Field() String smsCode,
    @Field() String deviceType,
  );

  ///登陆
  @POST("​/api​/Home​/touchResourceUser")
  Future<dynamic> homeRes();
}
