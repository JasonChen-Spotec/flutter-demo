import 'dart:developer';

import 'package:yyba_app/model/services_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'client_api.g.dart';

@RestApi()
abstract class ClientApi {
  factory ClientApi(Dio dio, {String baseUrl}) = _ClientApi;

  ///获取用户列表
  @POST("/user/product/list")
  Future<ServicesModel> getInviteList(
    @Field() int pageNum,
    @Field() int pageSize,
  );

  ///发送短信
  @POST("/sms/send")
  Future<ServicesModel> sendSms(
    @Field() String phone,
    @Field() String gbcode,
    @Field() String businessType,
  );
}
