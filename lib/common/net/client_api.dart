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

  ///资源类型
  @GET("/api/resourceType")
  Future<dynamic> resourceType({@Query('parent_id') String? parentId});

  ///首页推荐
  @POST("api/v1/UserResourceRecommend/GetRecommends")
  Future<dynamic> homeResRecommend();
}
