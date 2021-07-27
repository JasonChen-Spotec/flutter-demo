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

  ///发送短信
  @POST("/login")
  Future<ServicesModel> login(
    @Field() String phone,
    @Field() String gbcode,
    @Field() String smsCode,
  );
}
